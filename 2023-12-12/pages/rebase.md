# `git rebase`

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "fix link"
   commit id: "all them checksums"
   commit id: "Fix checksums after manual tests"
   commit id: "Merge pull request #1344"
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "Test aligner bwamem2"
   commit id: "Test aligner dragmap"
```

<video controls>
  <source src="/lance-loong.mp4" type="video/mp4">
</video>

<!-- Let's say you're going to convert all of the sarek workflow tests to nf-test -->

---

# 100 subworkflows later...

<!-- TODO -->

---

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "Fix checksums after manual tests"
   commit id: "Merge pull request #1344"
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
```

- You did it!

---

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
   checkout dev
```

---

```yaml
layout: image

# A wild Maxime
image: https://imgflip.com/i/88xfmj
```

<!-- Oh no! A wild Maxime appeared!  -->

---

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
   checkout dev
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351"
```

---

# Swiper no merging!

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
   checkout dev
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351"
   checkout "nf-test"
   merge dev id: "Merge branch 'dev' into nf-test"
   commit id: "Update snapshots"
```

<!-- "Merge dev" -->

---

# What we're trying to prevent

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
   checkout dev
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351"
   checkout "nf-test"
   merge dev id: "Merge branch 'dev' into nf-test" type:REVERSE
   commit id: "Update snapshots"
   checkout dev
   merge "nf-test" id: "Merge pull request #1600"
```

---

# Linear history

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
   checkout dev
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351" type:HIGHLIGHT
   checkout "nf-test"
```

<!-- Let's go back to before we merged dev -->

---

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351" type:HIGHLIGHT
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
```

`git rebase origin/dev`

---

# Before

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
   checkout dev
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351" type:HIGHLIGHT
   checkout "nf-test"
```

# After

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351" type:HIGHLIGHT
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
```

---

## Merge

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
   checkout dev
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351"
   checkout "nf-test"
   merge dev id: "Merge branch 'dev' into nf-test" type:REVERSE
   commit id: "Update snapshots"
   checkout dev
   merge "nf-test" id: "Merge pull request #1600"
```

## Rebase

```mermaid
%%{init: { 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'dev'}} }%%
gitGraph
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351 from max..."
   commit id: "fix params in test profiles"
   commit id: "update CHANGELOG"
   commit id: "Merge pull request #1351" type:HIGHLIGHT
   branch "nf-test"
   commit id: "Test aligner bwamem"
   commit id: "..."
   commit id: "Test UMI"
```