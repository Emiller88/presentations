# What's the catch?

<v-clicks>

- It's great... <div v-click>as long as it all runs on one machine.</div>
- If only there was a tool for orchestrating single machine processes...

</v-clicks>

# Why Nextflow though?

---

![Horse Size Duck](https://i.kym-cdn.com/entries/icons/original/000/011/895/horsesizedduck.jpg)

---

# Nextflow chunking a huge file and then making smaller DuckDB calls on it.

---

# DuckDB and Nextflow anti-patterns

- Running it with nf-sqldb
  - Could put pressure on the head node job
- Circle back around in a minute
