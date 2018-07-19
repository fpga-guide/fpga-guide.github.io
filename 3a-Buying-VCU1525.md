---
layout: page
sidebar: Xilinx VCU1525
subnav: true
section: '3a'
title: Purchasing a Xilinx VCU1525
description: Buying a Xilinx VCU 1525 FPGA for mining?  Read this first before doing anything
image: /public/images/fpga-buy.jpg
---

The VCU 1525 is Xilinx's stock FPGA.  Historically speaking, it was meant for computationally intensive applications like live video transcoding, data analytics, genomics, and machine learning.  

The stock version is able to run most public unencrypted bitstreams, but since it doesn't manage heat as well as the BCU's we don't recommend pushing these cards too much.  

[Link to Xilinx product page](https://www.xilinx.com/products/boards-and-kits/vcu1525-a.html)

[logo]: https://www.xilinx.com/content/dam/xilinx/imgs/kits/whats-inside/vcu1525-active.jpg "VCU1525"

These units are technically still available, but purchasing is a slow process as Xilinx doesn't typically sell 1 or 2 units to consumers like ourselves.  We'll be organizing a group-order for those who are interested.  

{% include signup.html %}

---

# Device Info

|Device| ![alt text][logo]|
|:---:|:---:|
| Core Voltage | 0.85v |
| Interface | PCIe Gen3 x 16 or Gen4 x8 via Edge Connector |
| Power & Thermal | 225W Max |
| Memory | 4 - 16GB DDR4 DIMMs |
| Cooling | Active Fan Cooling |


# Performance

Keccak and Tribus are two popular algorithms that have public bitstreams released by DigitalCruncher.  Please be careful when running these with your VCU 1525's and monitor heat closely.  They are available on the Algorithm pages.  

* [Keccak](/2b-Algorithms-Keccak)
* [Tribus](/2a-Algorithms-Tribus)