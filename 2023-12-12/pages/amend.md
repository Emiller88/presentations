# `git commit --amend`

<v-clicks depth="2">

- Amending a message `git commit --amend -m "New commit message"`
  - `git commit --amend --no-edit`
- Changes the commit hash

- For commits that have **_not_** been pushed to shared branches (main/master/dev).

</v-clicks >

<!-- - Mention that it's primarily used to correct the last commit but can be used with interactive rebase for earlier commits. -->

---

# `git commit --amend` Example

```bash {all|1,2|4|6,7}
$ git add nf_core/__main__.py
$ git commit -m "Add new func"

$ git commit --amend -m "Add new function"

$ ruff format nf_core/__main__.py
$ git commit --amend --no-edit
```

---

# `git commit --amend` with GitLens

<img src="/amend_gitlens.png" />

---

```yaml
transition: fade
```

## `git commit --amend` with GitHub Desktop

![Amend GitHub Desktop History](https://docs.github.com/assets/cb-130307/mw-1440/images/help/desktop/history-tab-in-commit-sidebar.webp)

---

## `git commit --amend` with GitHub Desktop

![Amend GitHub Desktop](https://docs.github.com/assets/cb-151890/mw-1440/images/help/desktop/amend-commit-context-menu.webp)
