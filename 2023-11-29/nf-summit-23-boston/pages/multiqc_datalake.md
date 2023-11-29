# Medallion Architecture

![Medalion Architecture](https://images.squarespace-cdn.com/content/v1/5bce4071ab1a620db382773e/c7b8783d-ac78-4e96-acd5-e29940c6e7d3/audit-logs-quality-diagram-v1-052920.png)

<!-- - Coined by Databricks -->

---

```yml
layout: quote
```

# ""I just thought MultiQC was a pretty HTML report"

Graham Wright"

<v-click>

-- Edmund Miller

</v-click>

---

# MultiQC also cleans your data!

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

<!--
- Coming to a python registry near you: Parquet output planned for MultiQC!
-->

---

## Simple query of MultiQC Outputs

```sql
CREATE TABLE reads AS
SELECT
    sample,
    reads_mapped_and_paired
FROM
    read_csv_auto("s3://nf-core-awsmegatests/rnaseq/multiqc/star_rsem/multiqc_data/multiqc_samtools_stats.txt");
```

---

<v-click>

# "MultiQC for your MultiQC"

</v-click>

![MultiQC example](https://raw.githubusercontent.com/ewels/MegaQC/master/docs/source/images/megaqc_homepage.png)

<!-- TODO Add a picture -->
<!-- TODO Add a Yo Dawg I heard you like MultiQC meme -->
<!-- - Phil's always looking into the future -->

---

# Starting to think in Aggregates

```sql {all|5}
CREATE TABLE reads
AS SELECT
    Sample,reads_mapped_and_paired
FROM read_csv_auto(
    "s3://nf-core-awsmegatests/sarek/results-*/test_full/multiqc/multiqc_data/multiqc_samtools_stats.txt",
    filename=true
);
```

<!-- - Pull the files in a make a query -->
<!-- - Can update the names in a `DDB` fuction -->
<!-- - How many reads have been processed in nf-core mega tests? -->
