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

```bash {1|3|4-7|9|9,10|9-14|16,17|16-|all}
$ git bisect start <broken-commit-or-tag> <working-commit-or-tag>

$ git bisect start HEAD 2.0.0
$ git bisect log
# bad: [0c464660d92f6d1e8ac9e8a9f16de297665aa62e] ci: Don't upload test report
# good: [04025de523dd111c9f86101255ed3d6f4c16fb5a] Update CHANGELOG.md
git bisect start 'HEAD' '2.0.0'

$ nf-test test
Passed!

$ git bisect good
Bisecting: 68 revisions left to test after this (roughly 6 steps)
[ce3ea031536497616db1682a1a57c05b5c2f4893] Merge pull request #325 from sateeshperi/dev

$ nf-test test
Failed!

$ git bisect bad
Bisecting: 33 revisions left to test after this (roughly 5 steps)
[457977069a75035b26967962c3e64e60e4ce71e8] add-UTILS-removeNextflowVersion-lib-update-snapshots
```

<!--
You can also skip a commit
You can also use other terms instead of good/bad!
-->

---

# `git bisect` in practice

```bash
$ git bisect run <command>
```

<v-click>

- Automatically runs nf-test 🚀

</v-click>

<v-click>

```bash
$ git bisect run nf-test test --profile docker --silent
```

</v-click>

<v-clicks>

- If the command passes it marks the commit as **good** ✅
- If the command fails it marks the commit as **bad** ⛔

</v-clicks>

<!--


- That's cool but do I really need to do a binary search?
  - Over 100 commits yes
- That sounds really manual...
  -->

---

```yaml
title: git bisect Summary
layout: image
image: https://d33wubrfki0l68.cloudfront.net/885284c7dc5d42c3aa6c2f8ae44668530fbf464d/d5448/static/3f8cc369ca0c0b0e8c8c1bb864becd34/5a523/git-bisect.jpg
backgroundSize: contain
```
