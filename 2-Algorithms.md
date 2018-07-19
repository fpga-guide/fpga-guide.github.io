---
layout: page
sidebar: What can FPGAs mine?
subnav: false
section: '2'
title: POW Algos compatible with FPGAs
description: Detailed list of all known POW Algorithms known to be FPGA mineable.  This list is growing!
image: /public/images/fpga-algos.jpg
---

---

**Well technically speaking ... anything!**  except iron, coal, etc.

FPGAs aren't so different from computers, they're reprogrammable to do different computations, they have access to different layers of memory, from small and fast (DRAM) to big and slow (classic DDR4).  

FPGA's, like CPUs, GPUs, and ASICs, have certain memory and compute bottlenecks which make them good / bad at mining different coins.

Similar to ASICs, FPGA logic runs at the silicon level.  To us laymen, it means it's compute speed is in the same ballpark.  Only difference is that FPGA's logic can be reprogramned, like an ASIC that can be modify it's POW algorithm.  You do lose some speed compared to ASICs (depends on the algorithm, maybe a factor of 2 to 10) but you gain flexibility, which is incredibly important.

---

# Mining Software

There are a few miners and bitstreams from various devs available, but a lot of them are initial tests and not the most profitable algorithms.  

**We'll be updating everyone as new downloads and miners are released.  Subscribe here and don't miss out on major changes.**

{% include signup.html %}

---

# Known POW Algorithms

The possibilities are quite endless, the community has only scratched the surface as to what is possible.  We've curated a list of POW algorithms that have been announced, implemented, or production ready.  These pages include all known miners, bitstream, and source code. 

{% assign pages_list = site.pages | sort:"section" %}
{% for node in pages_list %}
    {% if node.url contains '-Algorithms-' %}
* [{{ node.title }}]({{node.url}})
    {% endif %}
{% endfor %}
