```yaml
title: Simple Rebase Rules
layout: image
image: https://www.git-tower.com/learn/media/pages/git/faq/git-bisect/0e1cea9cd5-1697824976/bisect-overview.png
backgroundSize: contain
```

---

```yaml
title: Simple Rebase Rules
layout: image
image: https://www.git-tower.com/learn/media/pages/git/faq/git-bisect/483621528d-1697824976/bisect-checkout-middle.png
backgroundSize: contain
```

---

# `git bisect` in practice

```bash
$ git bisect start <broken-commit-or-tag> <working-commit-or-tag>

$ git bisect start HEAD 2.0.0
$ git bisect log
# bad: [0c464660d92f6d1e8ac9e8a9f16de297665aa62e] ci: Don't upload test report
# good: [66c6138322ec5cc87738219e24d65240299dcc10] fix: Set version for MultiQC
git bisect start 'HEAD' '2.5.0'

$ nf-test test
Passed!

$ git bisect good
Bisecting: 16 revisions left to test after this (roughly 4 steps)
[66c6138322ec5cc87738219e24d65240299dcc10] fix: Set version for MultiQC

$ nf-test test
Failed!

$ git bisect bad
```

<!--
You can also skip a commit
You can also use other terms instead of good/bad!
-->

---

# `git bisect` in practice

```bash
$ git bisect run <command>


$ git bisect run nf-test test --profile docker --silent
```

- Automatically runs nf-test

  - If the command passes it marks the commit as _good_ ✅
  - If the command fails it marks the commit as _bad_ ⛔

  <!--


- That's cool but do I really need to do a binary search?
  - Over 100 commits yes
- That sounds really manual...
  -->

---

# `git bisect` Summary

https://d33wubrfki0l68.cloudfront.net/885284c7dc5d42c3aa6c2f8ae44668530fbf464d/d5448/static/3f8cc369ca0c0b0e8c8c1bb864becd34/5a523/git-bisect.jpg
