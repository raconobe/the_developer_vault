 
#Step-by-step process to generate and set up  SSH keys:

Work & Personal Keys: 

File Structure in C:\Users\raulc\.ssh\
```
 C:\Users\raulc\.ssh\
├── id_ed25519_personal        (Private Key - Personal)
├── id_ed25519_personal.pub    (Public Key  - Add to Personal GitHub)
├── id_ed25519_work            (Private Key - Work)
├── id_ed25519_work.pub        (Public Key  - Add to Work GitHub)
└── config                     (Maps host aliases to the right key)
```


By keeping all key pairs inside ~/.ssh/ and using a config file to route them, you get total security separation with zero file permission headaches.

  



`ssh-keygen` failed because Windows OpenSSH does not automatically expand the `~` shortcut in file path flags like `-f`.

Use PowerShell's `$HOME` variable or the full explicit path instead:

```powershell
ssh-keygen -t ed25519 -C "personal_email@example.com" -f "$HOME\.ssh\id_ed25519_personal"

```

Or pass the explicit path directly:

```powershell
ssh-keygen -t ed25519 -C "personal_email@example.com" -f "C:\Users\raulc\.ssh\id_ed25519_personal"

```

Once that completes, repeat the same pattern for your work key:

```powershell
ssh-keygen -t ed25519 -C "work_email@company.com" -f "$HOME\.ssh\id_ed25519_work"

```


```
ssh-keygen -t ed25519 -C "raconobe@gmail.com" -f "$HOME\.ssh\id_ed25519_personal" 
```

---


**Step 1: Generate Both SSH Keys**

Run these commands in PowerShell (replace the emails with your actual personal and work email addresses):

```powershell
# 1. Generate Personal Key
ssh-keygen -t ed25519 -C "personal_email@example.com" -f ~/.ssh/id_ed25519_personal

# 2. Generate Work Key
ssh-keygen -t ed25519 -C "work_email@company.com" -f ~/.ssh/id_ed25519_work

```

```

```

```

```

```

```

```
```

```
```
```
```
```
```v





*(Press **Enter** through the prompts if you don't want to assign a password to the key files).*

---

**Step 2: Add Public Keys to Each GitHub Account**

1. **Copy Personal Public Key:**
```powershell
Get-Content ~/.ssh/id_ed25519_personal.pub | Set-Clipboard

```
it functions as ctr + c to the key go to the repository and paste the key

*Go to your **Personal GitHub > Settings > SSH and GPG keys > New SSH Key** and paste it.*
2. **Copy Work Public Key:**
```powershell
Get-Content ~/.ssh/id_ed25519_work.pub | Set-Clipboard

```


*Log into your **Work GitHub > Settings > SSH and GPG keys > New SSH Key** and paste it.*

---

**Step 3: Configure `~/.ssh/config**`

Open your config file in Notepad:

```powershell
notepad ~/.ssh/config

```

Delete anything currently inside it and paste this exact configuration:

```ssh
# Personal Account
Host github.com-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal
    IdentitiesOnly yes

# Work Account
Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work
    IdentitiesOnly yes

```

---

**Step 4: Test Both Connections**

Test each host alias in PowerShell:

```powershell
# Test Personal
ssh -T git@github.com-personal

# Test Work
ssh -T git@github.com-work

```

When you set remote URLs for your repositories, use `git@github.com-personal:username/repo.git` for personal projects and `git@github.com-work:company/repo.git` for work projects.