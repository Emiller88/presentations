# Nextflow Examples

---

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

---

## DuckDB in a process

---

### Templating baked in

- Seeing all of the dbt stuff and thinking, that&rsquo;s kinda like a Nextflow process

---

### Everyone will tell you the problem with duckdb is that it only runs on one computer

<!-- 1000 ducks Picture -->

---

## DuckDB for Writing a samplesheet

---

### Nextflow chunking a huge file and then making smaller DuckDB calls on it.

---

## DuckDB and Nextflow anti-patterns

- Pressure on the head node
- Circle back around in a minute
