# First, What is DuckDB?

<!-- TODO Make sure this Yellow is right -->
<simple-icons-duckdb class="text-4xl text-yellow-400"/>

<!-- - You can dodge some of the pandas syntax madness -->

- Open source(MIT licensed) in-process SQL OLAP database management system
- **"SQLite for analytics"**
  - SQL on files directly
  - Power of Databases without the headache
- Speed
  - L1 cache optimized
- Runs Anywhere

<!-- If those phrases mean anything to you -->

---

# L1 cache optimized

- Optimized to keep everything close to the CPU
<!-- Avoids memory and disk -->
- Even faster on compressed files

---

## Query Execution Engine

<!-- TODO Find this graphic in a high quality-->

---

# Database Alignment

![Remote Image](https://imgopt.infoq.com/articles/analytical-data-management-duckdb/en/resources/21figure-2-1686238750825.jpg)

<!-- TODO Maybe just make my own? https://mermaid.js.org/syntax/quadrantChart.html -->

<!--
OLAP: Online analytical processing
Focus is on *analysis*

OLTP: Online transaction processing
Focus is on responding to user requests

- SQLite - One tuple at a time (my understanding one row at a time)
- DuckDB - One column at a time
-->

---

# Simplified Data Access

```sql
SELECT AVG(trip_distance) FROM 's3://yellow_tripdata_20[12]*.parquet'

SELECT * FROM '~/local/files/file.parquet'

SELECT * FROM dataframe

SELECT * FROM 'https://shell.duckdb.org/data/tpch/0_01/parquet/lineitem.parquet'
```

<!-- cite: https://motherduck.com/blog/six-reasons-duckdb-slaps/ -->
<!-- These are all valid SQL statements in DuckDB -->

---

# Use with Popular Tools and Frameworks

```python {all|7}
import pandas as pd

import duckdb

mydf = pd.DataFrame({'a' : [1, 2, 3]})

print(duckdb.query("SELECT sum(a) FROM mydf;").fetchall())

```

<!-- cite: https://motherduck.com/blog/six-reasons-duckdb-slaps/ -->
<!--
R/Python/C/Rust/Julia
You name it, there's a plugin
-->

---

# PySpark compatible API

```python
import os

# Read the environment variable
use_duckdb = os.getenv("USE_DUCKDB", "false").lower() == "true"

if use_duckdb:
    from duckdb.experimental.spark.sql.functions import avg, col, count
    from duckdb.experimental.spark.sql import SparkSession
else:
    from pyspark.sql.functions import avg, col, count
    from pyspark.sql import SparkSession
```

<!-- TODO Add Clicks -->

|      | duckspark | pyspark   |
| ---- | --------- | --------- |
| real | 0m1.225s  | 0m5.411s  |
| user | 0m1.970s  | 0m12.700s |
| sys  | 0m0.160s  | 0m1.221s  |

<!-- cite: https://motherduck.com/blog/making-pyspark-code-faster-with-duckdb/ -->
<!--
Apparently running pyspark locally is a real pain.
I don't know I've never used spark
Probably great for local testing for now
-->

---

# TODO Biobear

https://www.wheretrue.dev/docs/exon/exondb/
