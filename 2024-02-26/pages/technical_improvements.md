# Roadmap for nf-core/tools

- Config builder for institutional profiles
- Minimal pipeline template
- Major improvements to Nextflow schema

---

# Restructuring of nf-core/modules

- nf-test improvements
- Improvements in getting maintainers involved(Codeowners, Slack reminders)

---

# Reference genomes Problem

- Migration of AWS-iGenomes
  - References have become out of date and users aren't aware
  - Manual updating
  - STAR 2.7 for Example
  - Refgenie was going to be the solution but unmaintained/unfunded, difficult to host
- Ends up with crazy reference genome creation logic in pipelines
  - Nice for end users, but usually a custom reference gets built once and then saved.

<!-- only a few people have the keys, have to get the data from someone and do the transfers -->

---

# Reference genomes Plan

- Creation of a simple workflow to automate building and publishing references

```yml
- genome: R64-1-1
  fasta: s3://ngi-igenomes/igenomes/Saccharomyces_cerevisiae/Ensembl/R64-1-1/Sequence/WholeGenomeFasta/genome.fa
  gtf: s3://ngi-igenomes/igenomes/Saccharomyces_cerevisiae/Ensembl/R64-1-1/Annotation/Genes/genes.gtf
  bed12: s3://ngi-igenomes/igenomes/Saccharomyces_cerevisiae/Ensembl/R64-1-1/Annotation/Genes/genes.bed
  mito_name: MT
  macs_gsize: 1.2e7
  readme: s3://ngi-igenomes/igenomes/Saccharomyces_cerevisiae/Ensembl/R64-1-1/Annotation/README.txt

- genome: GRCm39
  fasta: https://hgdownload.soe.ucsc.edu/goldenPath/mm39/bigZips/mm39.fa.gz
  gtf: https://hgdownload.soe.ucsc.edu/goldenPath/mm39/bigZips/genes/mm39.ncbiRefSeq.gtf.gz
  mito_name: MT
  site: https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001635.27/
  reference_version: GCF_000001635.27
```

- Users will make Pull Requests with info to build the indexes and references
- References will improve overtime instead of becoming outdated
- Main cost for AWS-iGenomes currently is egress so improvements in nf-core tooling around references

---

```yml
layout: image-right
image: https://hpc.nih.gov/training/gatk_tutorial/images/03-MarkDuplicatesSpark_queryname_benchmark_cpu_time_consume.png
```

# Resource optimization

- Bioinformatics is a cost-minimization problem
- Don't want to wait years for an analysis, but saving 5 minutes on a 18 hour analysis isn't changing anything

---

```yml
layout: image-right
image: https://hpc.nih.gov/training/gatk_tutorial/images/03-MarkDuplicatesSpark_coordinate_efficiency_cpu_constrain.png
```

---

```yml
layout: iframe-right
url: https://ncbench.github.io/report/report.html#
```

# Benchmarking

- Improvements overtime in Sarek, rnaseq initially
- NCBench
- Might create our own simple one

---

# Wave and nf-core

```diff
-    conda "bioconda::bowtie=1.3.0 bioconda::samtools=1.16.1"
-    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
-    'https://depot.galaxyproject.org/singularity/mulled-v2-ffbf83a6b0ab6ec567a336cf349b80637135bca3:c84c7c55c45af231883d9ff4fe706ac44c479c36-0' :
-    'biocontainers/mulled-v2-ffbf83a6b0ab6ec567a336cf349b80637135bca3:c84c7c55c45af231883d9ff4fe706ac44c479c36-0' }"
+    conda "${moduleDir}/environment.yml"
+    container "nf-core/modules/bowtie_align:bowtie_align--d797c0ccd2d330fd"
```

- More accessibility to contributors

---

# Technical Improvements Summary

- More of a serve yourself model
