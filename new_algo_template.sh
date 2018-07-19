#!/bin/sh

#define parameters which are passed in.
ALGO=$1
SECTION=$2

if [ $# -ne 2 ]
  then
    echo "usage: ./new_algo_template.sh Tribus 3a-Algorithms-Tribus.md"
    exit 1
fi

#define the template.
template_str=$(cat  << EOF
---
layout: page
title: $ALGO
subnav: true
section: '$2'
---

---

# Reported Speeds

**\* hashrates are per card**

| Author | Hash rate* | Power | 
|:---:|:---:|:---:|
| $ALGO | <b>2.1 GH/s</b> | ?? |
| $ALGO | <b>1.95 GH/s</b> | 210 W |

---

# Downloads

| Author | FPGA Device | Hash rate* | Power | Bitstream | Miner | Source |
|:---:|:---:|:---:|:---:|:---:|:---:|
| $ALGO | VCU 1525 | <b>1.95 GH/s</b> | 210 W | N/A | [CHANGE_ME](https://www.google.com) |N/A |
| $ALGO | VCU 1525 | <b>600 MH/s</b> | 91 W | N/A | N/A | [CHANGE_ME](https://www.google.com)

---

# Coins and Profitability

| Coin | 
|:---:|
| Denarius |
EOF)

eval "echo \"${template_str}\" > $2-Algorithms-$1.md"
