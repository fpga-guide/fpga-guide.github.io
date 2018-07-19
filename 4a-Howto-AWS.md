---
layout: page
sidebar: Try an FPGA on AWS
subnav: true
section: '4a'
title: FPGA Mining on AWS
description: No FPGA needed!  A detailed guide to FPGA Mining on AWS F1!
image: /public/images/how-to.jpg
---

<br>

**NOTE**: Before starting this tutorial, make sure you can access an F1 instance. If this is the first time you’re trying an FPGA instance with your AWS account, you may need to request an instance limit increase for F1, as the default limit was 0 for our account. The instructions on how to request a limit increase are [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html#request-increase). We found this out after spending hours on setting up and synthesizing a design. It took a few business days for the limit increase to be approved.

* Sign into your AWS console
* First, you will need to create and download your private key (.pem file). You will need this file to SSH into an AWS instance. The instructions on creating your key can be found [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair).
* Make you save this file in a safe place.
* You will also need to create an access key. This is needed once you’ve SSHed into an instance. To create an access key, go to AWS console, click on the top right corner where it shows your username -> My Security Credentials -> Users -> Click on your user name -> Click on security credentials tab -> Create access key. Once your key has been created, **download the access key file, as this is the only time where you can do so**. Store it somewhere you can easily find it. If you lose this file, you will have to create a new access key.
* Launch an FPGA Developer AMI instance from the AWS console. The FPGA Developer AMI comes with all the tools that are needed to use the EC2 F1.

> `-> AWS ‘Services’ -> EC2 -> Launch Instance -> Select ‘AWS Marketplace’ and search for FPGA Developer AMI`

* Select an instance type. For just playing around, use the t2.micro, which is the cheapest instance ($0.012/hour). For actually synthesizing an FPGA project using Vivado, Amazon recommends the more powerful c4.4xlarge instance ($0.796/hour) or the c4.8xlarge instance ($1.591/hour), as even the simple examples can take hours to synthesize. With the c4.8xlarge instance, it took 7-8 hours to synthesize the Tribus.

>`-> Click Review and Launch -> Launch`

* Once the instance has been started, SSH into the instance. Click on the “Connect” button to see how to SSH into the instance. Note that the username that shows there is wrong. It should be `centos`, not `root`.  (e.g., `ssh -i “xxx.pem” centos@ec2-xx-xxx-xxx-xxx.compute-1.amazonaws.com`).
* Once you’ve SSHed in, run `aws configure`. You will need to enter your Access Key ID and Secret Access Key ID, which are in the access key file you downloaded earlier.
* Clone the aws-fpga-miner git repo `git clone https://github.com/fpga-guide/aws-fpga-miner.git`, which contains all SDK, HDK, and all the algorithms. 
* CD into the cloned aws-fpga-miner git repo, run `source hdk_setup.sh`. Note that this can take some time (5~10 minutes)

After you got into this step, the next process are divided into three steps :
1. Synthesizing the miner with Xilinx Vivado
2. Creating an Amazon FPGA Image (AFI)
3. Running the miner program on an Amazon EC2 F1 instance

### **STEP 1 : Synthesizing The Miner With Xilinx Vivado**

* Change directory into the FPGA_Mining_AWS
* Inside this directory there’s 5 algorithms (grs, myr_grs, phi1612, skunk, tribus).
* Select the algorithm you want to use (in this tutorial I will use tribus algorithm).
* Change directory into tribus folder

> `cd aws-fpga-miner/hdk/cl/developer_designs/tribus`

* Then set the CL_DIR, you have to set this again if you’re exiting the ssh

> `export CL_DIR=$(pwd)`

* Verify Vivado is installed (optional)

> `vivado -mode batch`

* Change directory into build/scripts folder

> `cd $CL_DIR/build/scripts`

* Run Vivado synthesis, but there’s a few additional settings/options you can add :

   **a.** Normal with no additional settings :	
   > `./aws_build_dcp_from_cl.sh`

   **b.** Since this will take a lot of time you can be notified by email when synthesis is done : 	
   > `export EMAIL=your.email@example.com`
   > `$HDK_COMMON_DIR/scripts/notify_via_sns.py`
   > `./aws_build_dcp_from_cl.sh -notify`


   **c.** The build will run in background, but if you want to see what’s going on this is the command to do it :
   > `./aws_build_dcp_from_cl.sh -notify -foreground`

   **d.** You can change the clock settings too, you can see the clock recipe [here](https://github.com/aws/aws-fpga/blob/master/hdk/docs/clock_recipes.csv) :
   > `./aws_build_dcp_from_cl.sh -clock_recipe_a A1`

   **e.** If you want to see the synthesis log, you can do this inside the build/scripts/ folder
   > `tail -f last_log`

**NOTE** : If you're not sure, go with option **a** and check the process using option **e**. I estimated for c4.8xlarge instance the syntesizing process will take 7-8 hours for tribus algorithm.

### **STEP 2 : Creating an Amazon FPGA Image (AFI)**

Now that synthesis is done, we need to create an Amazon FPGA Image (AFI) from the specified design checkpoint (DCP). The AFI contains the FPGA bitstream that will be programmed on the FPGA F1 instance.

To create an AFI, the DCP must be stored on S3. So we first need to create an s3 bucket. Make sure your credentials are set up correctly for this (`aws configure`)

* Go to AWS S3 from AWS console
> `-> AWS 'Services' -> Storage -> S3`
* Create a bucket -> input the bucket name for example “your-bucket”
* Make sure the region is the same as the region you use to launch the EC2 instance to make it easier
* Then click Create

* Click the “your-bucket” bucket then create two folders

```
--your-bucket

------- dcp

------- logs
```

Name those folders dcp and logs.

* Now copy the output files from synthesis to the new s3 bucket

> `aws s3 cp $CL_DIR/build/checkpoints/to_aws/*.Developer_CL.tar s3://your-bucket/dcp/`

* Create a temp, then copy the temp into s3 bucket

> `touch LOGS_FILES_GO_HERE.txt`

> `aws s3 cp LOGS_FILES_GO_HERE.txt s3://your-bucket/logs/`

* Copying to s3 bucket may not work if your s3 bucket policy is not set up properly. To set the bucket polity, go to https://s3.console.aws.amazon.com/ -> Click on your bucket -> Click on Permissions tab -> Click on Bucket Policy.

Set the policy as listed below, and try copying the files again.
```
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Sid": "Bucket level permissions",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::365015490807:root"
        },
       "Action": [
           "s3:ListBucket"
        ],
       "Resource": "arn:aws:s3:::<bucket-name>"
    },
    {
        "Sid": "Object read permissions",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::365015490807:root"
        },
        "Action": [
            "s3:GetObject"
        ],
        "Resource": "arn:aws:s3:::<bucket-name>/<dcp-folder-name>/*.tar"
    },
    {
        "Sid": "Folder write permissions",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::365015490807:root"
        },
        "Action": [
            "s3:PutObject"
        ],
        "Resource": "arn:aws:s3:::<bucket-name>/<logs-folder-name>/*"
    }
    ]
}
```

Edit the bucket name and the folders name. Don’t forget to save it

* After that back to the terminal, and run this command
> `aws ec2 create-fpga-image --name <afi-name> --description <afi-description> --input-storage-location Bucket=<dcp-bucket-name>,Key=<path-to-tarball> --logs-storage-location Bucket=<logs-bucket-name>,Key=<path-to-logs>`
* Edit it based on your setting, for example :
> `aws ec2 create-fpga-image --name tribus-afi --description tribus_afi --input-storage-location Bucket=your-bucket,Key=dcp/01_01_18-999999.Developer_CL.tar --logs-storage-location Bucket=your-bucket,Key=logs/`

* The output of this command includes two identifiers that refer to your AFI: Write these down, as you will need them later.

   + **FPGA Image Identifier** or **AFI ID**: this is the main ID used to manage your AFI through the AWS EC2 CLI commands and AWS SDK APIs.
   This ID is regional, i.e., if an AFI is copied across multiple regions, it will have a different unique AFI ID in each region.  An example AFI ID is `afi-06d0ffc989feeea2a`.

   + **Global FPGA Image Identifier** or **AGFI ID**: this is a global ID that is used to refer to an AFI from within an F1 instance. For example, to load or clear an AFI from an FPGA slot, you use the AGFI ID.
   Since the AGFI IDs is global (by design), it allows you to copy a combination of AFI/AMI to multiple regions, and they will work without requiring any extra setup. An example AGFI ID is `agfi-0f0e045f919413242`.

* Check if the AFI generation is done. You must provide the **FPGA Image Identifier** returned by `create-fpga-image`:

> `aws ec2 describe-fpga-images --fpga-image-ids <AFI ID>`
         
* The AFI can only be loaded to an instance once the AFI generation completes and the AFI state is set to `available`. This can also take some time (Took ~1 hour).

```
{
    "FpgaImages": [
    {
        ...
        "State": {
            "Code": "available"
        },<
        ...
        "FpgaImageId": "afi-06d0ffc989feeea2a",
        ...
    }
    ]
}
```

Once you have gotten to this point, you have successfully synthesized an HDL design for the EC2 F1. Now you’re ready to program the FPGA and run the example.
Go to the EC2 Management Console from AWS console and stop your EC2 instance.

### **STEP 3 : Running the Example in an Amazon EC2 F1 Instance**

Change your Instance Type to **f1.2xlarge** (this is the one with an FPGA) and start the instance. To change the instance type:  Right click on your instance shown in the  `EC2 Management Console -> Click “Instance Settings” -> Change Instance Type -> Choose “f1.2xlarge”`. 

To start the instance again, don’t click `“Launch Instance”` as this will create a new instance, but `right-click on your instance, “Instance State”, then “Start”`. 
As mentioned above, if this is the first time you’re trying an F1 instance with your AWS account, you may need to request an instance limit increase.
* Once the F1 instance is running, SSH into the instance
* CD into the cloned aws fpga git repo and run `source sdk_setup.sh`
* Run `aws configure` and input your credentials. If you’ve done this before, and your credentials haven’t changed, you don’t need to do it again.
* Clear any AFI you have previously loaded in your slot :

> `sudo fpga-clear-local-image -S 0`

* Invoke the fpga-describe-local-image command to learn about which AFI, if any, is loaded onto a particular slot. For example, if the slot is cleared (slot 0 in this example), you should get an output similar to the following:

> `sudo fpga-describe-local-image -S 0 -H`

``` 
Type  FpgaImageSlot  FpgaImageId     StatusName    StatusCode   ErrorName    ErrorCode     ShVersion
AFI        0            none          cleared          1           ok            0      <shell_version>
Type    	FpgaImageSlot  VendorId   DeviceId 	   DBDF
AFIDEVICE        0          0x1d0f    0x1042      0000:00:0f.0
```

If the describe returns a status ‘Busy’, the FPGA is still performing the previous operation in the background. Please wait until the status is ‘Cleared’ as above.

* Now, try loading your AFI to FPGA slot 0:
> `sudo fpga-load-local-image -S 0 -I <FpgaImageGlobalId>`

< FpgaImageGlobalId > is the ID that you got before when running “aws ec2 create-fpga-image ..” and starts with agfi-….

* Verify that the AFI was loaded properly. The output shows the FPGA in the “loaded” state after the FPGA image “load” operation. The “-R” option performs a PCI device remove and rescan in order to expose the unique AFI Vendor and Device Id.
> `sudo fpga-describe-local-image -S 0 -R -H`

``` 
Type  FpgaImageSlot 	   FpgaImageId          StatusName    StatusCode   ErrorName    ErrorCode     ShVersion
AFI        0    	  agfi-0f0e045f919413242     loaded           0           ok            0      <shell version>
Type         FpgaImageSlot  VendorId    DeviceId   	DBDF
AFIDEVICE        0           0x6789      0x1d50
```

Now let’s try the `fpga_miner` program

CD into software/runtime/
> `cd tribus/software/runtime`

Do the command below if it's your first time running `fpga_miner`

> `chmod +x fpga_miner` 

Run the program

> `sudo ./fpga_miner -a tribus -o <mining-pool-url> -u <your-wallet> -p x`

The fpga_miner program should show the following output


```
** ccminer 2.2.4 (based on cpuminer 2.4.5) **
AFI PCI  Vendor ID: 0xabcd, Device ID 0x1234
Starting Stratum on stratum+tcp://xxxxx.xxxx:0000
Attempting to start 1 miner threads using 'tribus' algorithm
	1 AWS FPGA miner threads started.
Stratum difficulty set to 0.25
tribus block 202934, diff 46.815
accepted: 1/1 (diff 0.250), 0.00 MH/s yes!
accepted: 2/2 (diff 0.250), 0.00 MH/s yes!
accepted: 3/3 (diff 0.250), 600 MH/s yes!
tribus block 202935, diff 44.913
accepted: 4/4 (diff 0.250), 600 MH/s yes!
accepted: 5/5 (diff 0.250), 600 MH/s yes!
accepted: 6/6 (diff 0.250), 600 MH/s yes!
accepted: 7/7 (diff 0.250), 600 MH/s yes!
```


If you want to run it continuously even when you exit the instance, you can run this command :

> `nohup sudo /home/centos/homunculus/hdk/cl/developer_designs/tribus/software/runtime/fpga_miner -a tribus -o <mining-pool-url> -u <your-wallet> -p x &`

And to check how’s your miner doing, you can do this in /home/centos/

> `sudo tail -f nohup.out`

That’s all. You're welcome!

Reference : [legupcomputing.com](https://www.legupcomputing.com/blog/index.php/2017/08/10/step-by-step-guide-on-running-two-examples-on-the-amazon-fpga-cloud-amazon-ec2-f1/), [sprocket-fpga](https://github.com/sprocket-fpga/FPGA_Mining_AWS), [aws-fpga](https://github.com/aws/aws-fpga/tree/master/hdk)