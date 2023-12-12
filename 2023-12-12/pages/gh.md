```yaml
layout: section
```

# GitHub CLI

`gh`

---

# Fork a project

```zsh{|2}
ghf() {
	gh repo fork $1 --clone=true --remote=true
}
```

<v-click>

```zsh {1|3|14}
$ ghf https://github.com/cli/cli

✓ Created fork Emiller88/cli
Cloning into 'cli'...
remote: Enumerating objects: 50590, done.
remote: Counting objects: 100% (7277/7277), done.
remote: Compressing objects: 100% (1110/1110), done.
remote: Total 50590 (delta 6518), reused 6669 (delta 6162), pack-reused 43313
Receiving objects: 100% (50590/50590), 28.04 MiB | 788.00 KiB/s, done.
Resolving deltas: 100% (34495/34495), done.
From github.com:cli/cli
 * [new branch]        3888-document-explicitly-fill-flag -> upstream/3888-document-explicitly-fill-flag
# ...
✓ Cloned fork
! Repository cli/cli set as the default repository.
To learn more about the default repository, run: gh repo set-default --help
```

</v-click>

---

# Merge a bunch of PRs at once

```bash {all|1|2}
for pr in $(gh pr list | cut -f 1); do
    gh pr merge -r $pr;
done;
```

## Real world use:

<v-click>

```bash {1}
for pr in $(gh pr list -l $label -A app/renovate | cut -f 1); do
    gh pr merge -r $pr;
done;
```

</v-click>
