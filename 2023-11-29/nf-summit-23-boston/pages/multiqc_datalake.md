# Medalion Architecture

![Medalion Architecture](https://images.squarespace-cdn.com/content/v1/5bce4071ab1a620db382773e/c7b8783d-ac78-4e96-acd5-e29940c6e7d3/audit-logs-quality-diagram-v1-052920.png)

<!-- - Coined by Databricks -->

---

# DuckDB for querying the MultiQC Data Lake

<v-click>

> ""I just thought MultiQC was a pretty HTML report"
> -- Graham Wright"

</v-click>
<v-click>

> -- Edmund Miller

</v-click>

<v-click>

- MultiQC also cleans your data!

</v-click>

<v-click>

`multiqc_data/multiqc_data.json`

```json
{
    "report_data_sources": { [...] },
    "report_general_stats_data": [
        {
            "GM12878_REP1": {
                "percent_rRNA": 0.0009636926399566243
            },
            "K562_REP1": {
                "percent_rRNA": 0.0006633349954509511
            },
            "H1_REP2": {
                "percent_rRNA": 0.00020859186814645343
            },
            "GM12878_REP2": {
                "percent_rRNA": 0.0020656724793101633
            // ..
        }
    ],
    // ...
}
```

</v-click>

---

## Simple query of Multiqc Outputs

```sql
CREATE TABLE reads AS
SELECT
    sample,
    reads_mapped_and_paired
FROM
    read_csv_auto("s3://nf-core-awsmegatests/rnaseq/multiqc/star_rsem/multiqc_data/multiqc_samtools_stats.txt");
```

<v-click>
- Parquet output planned for MultiQC!
</v-click>

---

<v-click>

# MultiQC for your MultiQC

</v-click>

![MultiQC example](https://raw.githubusercontent.com/ewels/MegaQC/master/docs/source/images/megaqc_homepage.png)

<!-- TODO Add a picture -->
<!-- TODO Add a Yo Dawg I heard you like MultiQC meme -->
<!-- - Phil's always looking into the future -->

---

# What if we never needed MegaQC?

- We can have this today. Do we really need something fancier?
- Maybe we could just add DuckDB-WASM to MultiQC and you can query in the browser?

<!-- - What if we could get 90% of the value from 10% of the work -->

---

## Starting to think in Aggregates

```sql {all|5}
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
