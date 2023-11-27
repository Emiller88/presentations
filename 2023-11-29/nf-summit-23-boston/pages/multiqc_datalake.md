# DuckDB for querying the MultiQC Data Lake

---

## Simple query of Multiqc

```sql
CREATE TABLE reads AS SELECT Sample,reads_mapped_and_paired FROM read_csv_auto("s3://nf-core-awsmegatests/rnaseq/*/multiqc/star_rsem/multiqc_data/multiqc_samtools_stats.txt");
```

---

# MegaQC

- MultiQC for your MultiQC
  <!-- - Phil's always looking into the future -->
  <!-- TODO Add a picture -->

---

## We never needed MegaQC

- What if we could get 90% of the value from 10% of the work
- We can have this today. Do we really need something fancier?
- Maybe we could just add DuckDB-WASM to MultiQC and you can query in the browser?

---

## Starting to think in Aggregates

```sql
CREATE TABLE reads
AS SELECT
    Sample,reads_mapped_and_paired
FROM read_csv_auto(
    "s3://nf-core-awsmegatests/sarek/*/test_full/multiqc/multiqc_data/multiqc_samtools_stats.txt",
    filename=true
);
```

- Pull the files in a make aquery
- Can update the names in a `DDB` fuction
- How many reads have been processed in nf-core mega tests?

---

<https://duckdb.org/docs/extensions/httpfs#s3>

## Benchmarking

Use Queries from DuckDB meet-up

---

### HTTPFS vs Nextflow staging benchmark

---

### HTTPFS with Parquet vs Nextflow staging benchmark

---

#### Quick Parquet Aside

1.  Columnar Data storage

    <https://www.youtube.com/watch?v=2i2nyodhGkk&list=PLIYcNkSjh-0ztvwoAp3GeW8HNSUSk_q3K&index=8>

    ![img](img/why-columnar.png)

    TLDR only get the columns you want so faster
    compression speeds things up even more!

2.  Duckdb is smart enough to not download the whole parquet file

    <https://www.youtube.com/watch?v=33sxkrt6eYk&list=PLIYcNkSjh-0ztvwoAp3GeW8HNSUSk_q3K&index=4>

    What about Fusion? Instead of httpfs

---

### HTTPFS with Iceberg vs Nextflow staging benchmark Iceberg

---

### HTTPFS vs Fusion
