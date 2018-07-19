---
layout: page
sidebar: Bittware XUPP3R-VU9P
subnav: true
section: '3c'
title: Purchasing a Bittware XUPP3R-VU9P
description: Buying a XUPP3R-VU9P FPGA for mining?  Read this first before doing anything
image: /public/images/fpga-buy.jpg
---

<p class="message" style="color:red;">Sale and production of Bittware XUPP3R-VU9P is currently on-hold with no announced release date.</p>

First off, an FPGA mining device is split into the FPGA Board (VCU1525, BCU1525, XUPP3R), and the actual chip (VU9P, VU13P).  Here for instance

* XUPP3R is the FPGA Board. 
* VU9P is the chip.

So when we see chats and posts about the XUPP3R-VU9P, it basically means a Bittware FPGA Board, using a Xilinx FPGA chip.  Different boards have different connection interfaces, different heat and power management tools, etc.  

Specifically the Bittware XUPP3R-VU9P crypto version has two advantages over the VCU1525 boards: 

1. it has four QSFP28 100G ports so you can daisy chain 4 FPGA's together to mine Xevan at 162MH/s, and 
2. it has flexible memory options, so you can install either DDR4 or QDRII+ SRAM; the QDR memory gives way faster hash rates on Equihash vs. DDR4.

Unfortunately it also has a near $6000 USD price tag, and as of right now no release dates have been announced.  


### Device Specs
<br>

![alt text][logo]

[logo]: https://www.bittware.com/wp-content/uploads/2017/09/XUPP3R-transparent-800px.svg "XUPP3R"

* Xilinx Virtex UltraScale+ VU7P/VU9P/VU11P
* Up to two PCIe x16 interfaces supporting Gen1, Gen2, or Gen3
* Up to two PCIe x8 interfaces supporting Gen4
* Four QSFP28 cages for 1x 400GbE, 4x 100GbE, 4x 40GbE, 16x 25GbE, or 16x 10GbE
* Board Management Controller for Intelligent Platform Management
* Timestamping support
* Utility I/O: USB 2.0, serial expansion port
* Memory options:
* up to 512 GBytes of DDR4 SDRAM with ECC
* Up to 288 MBytes QDR-II+
* Development Environments: RTL, C/C++, and OpenCL
