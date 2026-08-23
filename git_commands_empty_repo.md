Step 1

```powershell
git init -b main
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin git@github.com-personal:raconobe/the_developer_vault.git
```

Step 2 

```powershell
 git add . ; git commit -m "Update code" ; git push -u origin main
```

---





Yes, you can configure Git to automatically name your default branch `main` right when you run `git init`, avoiding the need to run `git branch -M main` afterwards.

---

### Option 1: Set the branch name during `git init`

Pass the `-b` flag directly when initializing:

```powershell
git init -b main
```

---

### Option 2: Set `main` as your global default for all future repositories

Set this configuration once on your system, and every new `git init` will automatically start on `main` instead of `master`:

```powershell
git config --global init.defaultBranch main
```

---

### Streamlined Workflow

With the global config set, your Step 1 becomes:

```powershell
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com-personal:raconobe/the_developer_vault.git
git push -u origin main

```
```








