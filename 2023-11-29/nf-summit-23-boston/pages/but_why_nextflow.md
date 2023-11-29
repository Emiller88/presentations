# What's the catch?

<v-clicks depth=2>

- It's great... as long as it all runs on one machine.

- If only there was a tool for orchestrating single machine processes...

</v-clicks>

---

```yml
layout: center
```

![Horse Size Duck](https://i.kym-cdn.com/entries/icons/original/000/011/895/horsesizedduck.jpg)

---

# TODO Nextflow chunking a huge file and then making smaller DuckDB calls on it.

---

# DuckDB and Nextflow anti-patterns

- Running it with nf-sqldb
  - Designed to be a "client"
  - Could put pressure on the head node job
  - Motherduck is a managed DuckDB service that could alleviate this
