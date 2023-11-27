---
theme: seriph
# TODO Update background
background: https://source.unsplash.com/collection/94734566/1920x1080
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  A deep dive into the powerful combination of Nextflow and database technologies. We’ll discuss the evolving landscape of data engineering in after era of big data. We’ll explore how a Nextflow plugin can rival popular tools, opening up new possibilities for data transformations and pipelining. Next, we’ll delve into the historical use of files over databases in bioinformatics and learn about the paradigm-shifting potential of DuckDB and Apache Arrow through biobear. Lastly, we’ll explore the complimentary pairing of DuckDB and Nextflow, bridging the gap between file-based and database approaches for big data processing.

  Learn more at [https://summit.nextflow.io/boston/agenda/summit/nov-29-database-uses/](https://summit.nextflow.io/boston/agenda/summit/nov-29-database-uses/).
drawings:
  persist: false
transition: slide-left
title: Nextflow and Database Uses
mdc: true
---

# Nextflow and Database Uses

Powering data engineering, exploring DuckDB, and beyond

<!--
The last comment block of each slide will be treated as slide notes. It will be visible and editable in Presenter Mode along with the slide. [Read more in the docs](https://sli.dev/guide/syntax.html#notes)
-->

---

```yaml
transition: fade-out
layout: default
```

# Table of contents

<Toc></Toc>

---

```yaml
transition: slide-up
level: 2
```

# Intro

---

src: ./pages/bioinformatics_dataengineering.md

---

src: ./pages/intro_duckdb.md

---

src: ./pages/nextflow_examples.md

---

src: ./pages/but_why_nextflow.md

---

src: ./pages/nfcore_use_cases.md

---

src: ./pages/multiqc_datalake.md
