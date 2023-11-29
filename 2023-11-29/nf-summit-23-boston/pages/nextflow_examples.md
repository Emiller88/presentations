# Nextflow Examples

---

# DuckDB as a Parquet Reader for Nextflow

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

# Templating baked in

DBT

```sql
with customers as (
    select * from {{ ref('stg_customers') }}
),
-- ...
```

<!-- TODO Add click -->

```nextflow
// ...

process DUCKDB_SQL_FILE {
  input:
  file stg_customers_file

  script:
  """
  duckdb -c "
  with customers as (
    select * from ${stg_customers_file}
  ),
  -- ...
  "
  """
}
```

<!-- Seeing all of the dbt stuff and thinking: Nextflow can do that -->

---

# Staging Files

```nextflow {all,4,9,5,10}
process DUCKDB_NEXTFLOW_STAGING {

    input:
    path csv
    val greaterthan

    script:
    """
    duckdb "SELECT * FROM read_csv('${csv}', filename=true);
    SELECT region FROM sales GROUP BY region HAVING sum(amount) > ${greaterthan};"
    """
}
```

# HTTPFS Plugin

```nextflow {all,4,8}
process DUCKDB_HTTPFS {

    input:
    val link // s3://blah/blah.csv

    script:
    """
    duckdb "SELECT * FROM read_csv('${link}', filename=true);"
    """
}
```

- Let DuckDB Read from s3 using the `HTTPFS` plugin

<!-- This is powerful because DuckDB can pull only the parts it needs in the parquet files -->

---

# Use it with a template file

```nextflow
process CUSTOMERS_TABLE {

    input:
    file query
    file stg_customers
    file stg_orders
    file stg_payments

    script:
    template "create_customers_table.bash"
}
```

`create_customers_table.bash`

```bash
#!/usr/bin/env bash
duckdb -c "
WITH customers AS (
    select * from $stg_customers,
),
orders as (
    select * from $stg_orders
),
payments as (
    select * from $stg_payments
),
customer_orders as (
    select
        customer_id,
        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from orders
    group by customer_id
),
# ...
"
```

---

# Pass a Query to DuckDB

```nextflow
workflow {
    DUCKDB("""
           SELECT * FROM read_csv('${link}', filename=true);
           -- display tables
           SHOW tables;
           """
    )
}
```

<!-- <v-clicks> -->

```nextflow
process DUCKDB {
    input:
    val query

    script:
    """
    duckdb :memory: "$query"
    """
}
```

<!-- TODO Add result -->

---

<!-- Why would you ever want to do that? -->
<!-- TODO # Hook passing a query into SQLbot -->
<!-- --- -->

# Using a sql file

<!-- TODO Test this -->
<!-- TODO Sync up the order of this with passing a query -->

```nextflow
process DUCKDB_SQL_FILE {
    input:
    file query_file
    file csv

    script:
    """
    cat $csv | duckdb -c ".read $query_file"
    """
}


workflow {
    DUCKDB_SQL_FILE(
        file("$projectDir/models/example.sql"),
        nextflix_top_10
    )
}
```

- Problem is this doesn't like Nextflow's variable insertions

---

# SQL helper function

```nextflow
process DUCKDB_SHEBANG {
  input:
  file csv

  script:
  """
  #!/usr/bin/env duckdb :memory:

  SELECT * from ${csv}
  """
```

```nextflow
process DUCKDB_SQL_FILE {
  input:
  file csv

  script:
  sql
  """
  SELECT * from ${csv}
  """

  // OR

  script:
  sql example.sql
}
```
