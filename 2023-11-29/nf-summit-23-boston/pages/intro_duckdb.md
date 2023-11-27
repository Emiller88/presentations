# Intro to DuckDB

---

# Power of Databases without the headache

- Think sqlite for analytics

---

# Overview of features

- MIT licensed
- SQL on files directly
- Speed
<!-- - You can dodge some of the pandas syntax madness -->

---

# Database Alignment

![Remote Image](https://imgopt.infoq.com/articles/analytical-data-management-duckdb/en/resources/21figure-2-1686238750825.jpg)

---

# L1 cache optimized

- Optimized to keep everything close to the CPU
<!-- Avoids memory and disk -->
- Even faster on compressed files

---

## Query Execution Engine

- SQLite - One tuple at a time
<!-- TODO Find this graphic in a high quality-->

---

## The Modern Data Struggle

- Very few people making a _huge_ queries everyday
  <!-- - Big data is dead -->
  - Most of the work is done on the most recent data
  <!-- Think samples that you've run in the past month -->
  - But what if we needed it in the future?
  <!-- Data hoarders -->
- Files are in object stores(s3, apache iceberg)
<!-- Bioinformaticians love files -->

---

## R/Python/SQL/C

- You name it, there's a plugin

---

## PySpark compatible API

---

# TODO Biobear

https://www.wheretrue.dev/docs/exon/exondb/

---

## What's the catch?

<v-clicks>

- It's great... <div v-click>as long as it all runs on one machine.</div>
- If only there was a tool for orchestrating single machine processes...

</v-clicks>
