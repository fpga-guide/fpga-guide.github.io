---
layout: page
sidebar: Buying FPGAs
subnav: false
section: '3'
title: Purchasing an FPGA
description: Read this before buying anything!  FPGAs are hard to find, and there are important differences and many scams.
image: /public/images/fpga-buy.jpg
---

---

If you're like me, it took quite a bit of courage to take the plunge and drop $4000 on a VCU 1525.  Especially when at the time, the only payment method was a bank wire to a random account 😂

But now I'm glad I did it, since the FPGAs sold out quickly and it's now uncertain when the next batch will be available.  There are 3 main devices currently targeted by the FPGA devs.

* Xilinx VCU 1525
* BCU 1525 (sold out)
* Bittware XUPP3R (on hold)

<h1> Xilinx VCU 1525 </h1>

The Xilinx VCU 1525 is just a normal FPGA that's good for mining certain coins.  Originally this is something a hardware or digital design company would purchase and use in their labs, so there aren't any consumer facing purchase channels setup.  To buy one, you'd have to contact one of the many distributors, or try to buy one directly from someone else.  We'll be trying to organize another group-buy, drop us your email if you're interested.  

{% include signup.html %}

The VCU 1525 will be able to run most of the bitstreams released, but in order to achieve the maximum hashrates **you need to make modifications** to it.  We'll be adding detailed guides on these modifications once we receive our board!  

These mods range from easy to complex, and usually aim to manage component temperature.  These chips run hot quickly, so the more heat you can dissapate, the faster you can drive the clock, and the higher your hashrates.

<h1>BCU 1525<strong style="color:red;">[Sold Out]</strong></h1>

The BCU 1525's are essentially a modified version of the Xilinx VCU 1525 offered by a few smaller private parties.  GPUHoarder from SQRL Research is techncially the manufacturer and seller of the BCU units.  They source VCU 1525's from Xilinx, work with a manufacturer to make the heat management mods, and then do some post-processing and programming to make them mining ready.  

One of the benefits of buying the BCU is that it their devices have an encryption key burned into the device (known as an efuse key) which gives the owner the ability to use proprietary mining software offered by SQRL and mining software developers from [all-mine.co](https://all-mine.co/).

These were originally offered on https://fpga.land/, but sortly after they moved the sale to https://mineority.io/.  

5000 BCU 1525's were sold, units are now **SOLD OUT**, and estimated to ship some time in August 2018.

<h1>Bittware XUPP3R<strong style="color:red;">[On Hold]</strong></h1>

These were supposed to be a custom crypto mining FPGA developed by Bittware, originally the crypto version was supposed to be sold for $5895 USD a piece.  The main difference is that it has flexible memory options, so instead of just DDR4 memory you could also install QDRII+ SRAM.  QDR memory lets you mine Equihash at a much faster rate.

These are currently on hold due to technical challenges, no known release date is scheduled.

Also worth noting, Bittware was recently acquired by Molex who we all know.  The acquisition definitely will impact their timelines so things here might not be as straightforward.  