---
layout: page
sidebar: Downloads
subnav: false
section: '5'
title: Download the latest FPGA miners, bitstreams, and source code here!
description: The latest downloads and updates, all organized in one place for the mining community along with tutorials and documentation.
image: /public/images/downloads.jpg
---

---

<p class="message" style="color:red;">Updated Regularly! Subscribe to our updates and we'll let you know as new miners and bitstreams become available</p>

{% include signup.html %}

---

### DigitalCruncher

| Algorithm | FPGA Device | Hash rate* | Power | Bitstream | Miner | Source |
|:---:|:---:|:---:|:---:|:---:|:---:|
| Tribus | VCU 1525 | <b>1.95 GH/s</b> | 210 W | [Download](https://github.com/digitalcruncher/keccak-tribus/releases/download/2/vcu1525_tribus_3_650.bit.tar.gz) | [Miner](https://github.com/digitalcruncher/keccak-tribus/releases/download/2/ccminer.vcu1525.linux.src.tar.gz) | N/A |
| Keccak | VCU 1525 | <b>12.6 GH/s</b> | ??? | [Download](https://github.com/digitalcruncher/keccak/releases/download/1/vcu1525-keccak-variable.tar.gz) | [Download](https://github.com/digitalcruncher/keccak-tribus/releases/download/2/ccminer.vcu1525.linux.src.tar.gz) | N/A |

### Sprocket

| Algorithm | FPGA Device | Hash rate* | Power | Bitstream | Miner | Source |
|:---:|:---:|:---:|:---:|:---:|:---:|
| Tribus | VCU 1525 | <b>600 MH/s</b> | 91 W | N/A | N/A | [Download](https://github.com/digitalcruncher/keccak-tribus/releases/download/2/vcu1525_tribus_3_650.bit.tar.gz)  |
| Phi1612 | VCU 1525 | <b>62 MH/s</b> | 91 W | N/A | N/A | [Download](https://github.com/sprocket-fpga/FPGA_Mining_AWS/tree/master/phi1612)
| Groestl | VCU 1525 | <b>600 MH/s</b> | 91 W | N/A | N/A | [Download](https://github.com/sprocket-fpga/FPGA_Mining_AWS/tree/master/grs)
| Myriad-groestl | VCU 1525 | <b>600 MH/s</b> | 91 W | N/A | N/A | [Download](https://github.com/sprocket-fpga/FPGA_Mining_AWS/tree/master/myr_grs)
| Skunkhash | VCU 1525 | <b>600 MH/s</b> | 91 W | N/A | N/A | [Download](https://github.com/sprocket-fpga/FPGA_Mining_AWS/tree/master/skunk)


### senseless

| Algorithm | FPGA Device | Hash rate* | Power | Bitstream | Miner | Source |
|:---:|:---:|:---:|:---:|:---:|:---:|
| Keccak | VCU 1525 | ??? | ??? | N/A | N/A | [Download](https://github.com/sense-it/rtl/tree/master/keccak_512)
| Nist5 | VCU 1525 | ??? | ??? | N/A | N/A | [Download](https://github.com/sense-it/rtl/tree/master/aws-nist5/design)

### Maetti79

| Algorithm | FPGA Device | Hash rate* | Power | Bitstream | Miner | Source |
|:---:|:---:|:---:|:---:|:---:|:---:|
| Eth | Stratix V | ??? | ??? | N/A | N/A | [Download](https://github.com/Maetti79/ethminer) |


### whitefire990

| Algorithm | FPGA Device | Hash rate* | Power | Bitstream | Miner | Source |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 0xToken | VCU 1525 | <b>11.55 GH/s</b> | ??? | [Bitstream](http://www.zetheron.com/Downloads/VCU1525_0xToken_11_55GHS_V2.bit) | [Miner](http://www.zetheron.com/Downloads/FXTokenMiner_v1_32.zip) | N/A | see note #1 |
| 0xToken | VCU 1525 | <b>15.09 GH/s</b> | ??? | [Bitstream](http://zetheron.com/Downloads/VCU1525_0xToken_15_09GHS.mcs) | [Miner](http://www.zetheron.com/Downloads/FXTokenMiner_v1_32.zip) | N/A | see note #1 |
| 0xToken | VCU 1525 | <b>8.8 GH/s</b> | ??? | [Bitstream](http://zetheron.com/Downloads/VCU1525_0xToken_8_8GHS.bit) | [Miner](http://www.zetheron.com/Downloads/FXTokenMiner_v1_32.zip) | N/A | see note #1 |


*note 1 for whitefire's FX miner*

Use lower hashrate bitstream if heat is issue. 

1. [Install the FTDI D2XX Windows drivers from the FTDI](http://www.ftdichip.com/Drivers/D2XX.htm)
2. [Download Windows Vivado Lab Edition](https://www.xilinx.com/support/download.html)
3. [Follow these instructions](http://www.zetheron.com/Downloads/VCU1525_Instructions.pdf)
