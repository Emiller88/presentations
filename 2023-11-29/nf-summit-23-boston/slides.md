---
theme: seriph
# TODO Update background
background: https://source.unsplash.com/collection/94734566/1920x1080
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
drawings:
  persist: false
transition: slide-left
title: Nextflow and Database Uses
mdc: true
addons:
  - slidev-addon-asciinema
---

# Nextflow and Database Uses

Powering data engineering, exploring DuckDB, and beyond

<!--
The last comment block of each slide will be treated as slide notes. It will be visible and editable in Presenter Mode along with the slide. [Read more in the docs](https://sli.dev/guide/syntax.html#notes)
-->

---
transition: fade-out
layout: default
---

# Table of contents


<Toc minDepth="2"></Toc>


---
transition: slide-up
level: 2
---

# Using DuckDB as a parquet reader

```nextflow{all|5}
include { fromQuery } from 'plugin/nf-sqldb'

channel
  .fromQuery(
    "select Z_noise from read_parquet('area1.parquet')", 
    db: 'flights'
  ) | view
```

<Asciinema src="/casts/parquet_reader.cast" :playerProps="{speed: 2, rows: 15}"/>
