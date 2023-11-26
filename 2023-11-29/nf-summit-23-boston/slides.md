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

# Intro


# Intro to DuckDB


## Power of a Databases without the headache


## L1 cache optimized


## R/Python/SQL/C

-   You name it, there&rsquo;s a plugin


## PySpark compatible API


# Bioinformatics as data engineering


## Bioinformaticians love files


## Medalion architecture

-   Bronze = samtools<sub>stats.txt</sub>
-   Silver = multiqc<sub>samtools</sub><sub>stats.txt</sub>
-   Gold = ???


## We never needed MegaQC

-   What if we could get 90% of the value from 10% of the work
-   We can have this today. Do we really need something fancier?
-   Maybe we could just add DuckDB-WASM to MultiQC and you can query in the browser?


# Nextflow Examples


## DuckDB as a Parquet Reader for Nextflow

```nextflow{all|5}
include { fromQuery } from 'plugin/nf-sqldb'

channel
  .fromQuery(
    "select Z_noise from read_parquet('area1.parquet')", 
    db: 'flights'
  ) | view
```
<!-- FIXME -->
<Asciinema src="/casts/parquet_reader.cast" :playerProps="{speed: 2, rows: 15}" />

## DuckDB in a process


### Templating baked in

-   Seeing all of the dbt stuff and thinking, that&rsquo;s kinda like a Nextflow process


### Everyone will tell you the problem with duckdb is that it only runs on one computer

Y&rsquo;all see where I&rsquo;m going with this right?
1000 ducks


## DuckDB for Writing a samplesheet


## DuckDB and Nextflow anti-patterns

-   Pressure on the head node
-   Circle back around in a minute


# nf-core use cases


## nf-co2 querying


## Finding a Module in multiple pipelines?

-   What&rsquo;s the most used module in all the pipelines


### TODO Query <https://github.com/nf-core/website/blob/main/.cache.tar.xz>

For most used module


# DuckDB for querying the MultiQC Data Lake


## Simple query of Multiqc

    CREATE TABLE reads AS SELECT Sample,reads_mapped_and_paired FROM read_csv_auto("s3://nf-core-awsmegatests/rnaseq/*/multiqc/star_rsem/multiqc_data/multiqc_samtools_stats.txt");


## Starting to think in Aggregates

    CREATE TABLE reads
    AS SELECT
        Sample,reads_mapped_and_paired
    FROM read_csv_auto(
        "s3://nf-core-awsmegatests/sarek/*/test_full/multiqc/multiqc_data/multiqc_samtools_stats.txt",
        filename=true
    );

-   Pull the files in a make aquery
-   Can update the names in a `DDB` fuction
-   How many reads have been processed in nf-core mega tests?

<https://duckdb.org/docs/extensions/httpfs#s3>


## Benchmarking

Use Queries from DuckDB meet-up


### HTTPFS vs Nextflow staging benchmark


### HTTPFS with Parquet vs Nextflow staging benchmark

1.  Quick Parquet Aside

    1.  Columnar Data storage
    
        <https://www.youtube.com/watch?v=2i2nyodhGkk&list=PLIYcNkSjh-0ztvwoAp3GeW8HNSUSk_q3K&index=8>
        
        ![img](img/why-columnar.png)
        
        TLDR only get the columns you want so faster
        compression speeds things up even more!
    
    2.  Duckdb is smart enough to not download the whole parquet file
    
        <https://www.youtube.com/watch?v=33sxkrt6eYk&list=PLIYcNkSjh-0ztvwoAp3GeW8HNSUSk_q3K&index=4>
        
        What about Fusion? Instead of httpfs


### HTTPFS with Iceberg vs Nextflow staging benchmark Iceberg


### HTTPFS vs Fusion


### Nextflow chunking a huge file and then making smaller DuckDB calls on it.
