```yaml
layout: two-cols
transition: fade
```

<template v-slot:default>

# Data Engineering

<v-clicks>

- ETL
- Databases
- Data quality
- Building pipelines that transform this data into formats that are more useful for Data Scientists.

</v-clicks>

</template>
<template v-slot:right>

# Data Science

<v-clicks>

- Statistics
- Creating Models(Machine Learning)
- Creating Reports

</v-clicks>
</template>

<!--
My Niave take:
-->

---

```yaml
layout: two-cols
```

<!-- TODO Add clicks -->
<template v-slot:default>

# Bioinformatics

<v-clicks>

- Running Tools
- Files
- Data quality
- Building pipelines that transform this data into formats that are more useful for Computational Biologists.

</v-clicks>
</template>
<template v-slot:right>

# Computational Biology

<v-clicks>

- Statistics
- Create Models(Machine Learning)
- Create Reports
- Create algorithms

</v-clicks>
</template>

<!--
My second naive take:
-->

---

# The Modern Data Struggle

<v-clicks>

- Very few people making a _huge_ queries everyday
  - Most of the work is done on the most recent data
  - But what if we needed it in the future?
- Files are in object stores(s3, apache iceberg)

</v-clicks>

<!-- - Big data is dead
- Think samples that you've run in the past month
- Data hoarders
- Bioinformaticians love files
-->
