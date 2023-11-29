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

<!-- TODO Do the oar for datalakehouse -->

---

```yaml
src: ./pages/bioinformatics_dataengineering.md
```

---

```yaml
src: ./pages/intro_duckdb.md
```

---

```yaml
src: ./pages/nextflow_examples.md
```

---

```yaml
src: ./pages/but_why_nextflow.md
```

---

```yaml
src: ./pages/nfcore_use_cases.md
```

---

```yaml
src: ./pages/multiqc_datalake.md
```

---

# Conclusion

<v-clicks>

- We've already built data lakehouses unknowningly
- With DuckDB and Nextflow in combination we can capitalize on them

</v-clicks>

![Nextflow](https://github.com/nextflow-io/trademark/raw/master/nextflow-logo-bg-light.png)

<simple-icons-duckdb class="text-4xl text-yellow-400"/>
