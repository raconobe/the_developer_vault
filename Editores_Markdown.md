 Desktop Markdown editors

 **free and open-source desktop Markdown editors** that work directly with single local files without forcing vault structures or heavy IDE workspaces:

### 1. MarkText

* **Style:** True WYSIWYG (Live inline rendering)
* **Platforms:** Windows, macOS, Linux
* **Best for:** Getting the exact Typora-like experience for free. Syntax formatting vanishes into clean text as soon as you type it. 

### 2. Zettlr

* **Style:** Hybrid / Academic Markdown Editor
* **Platforms:** Windows, macOS, Linux
* **Best for:** Lightweight local file editing with strong table, code block, and math handling. It opens standalone `.md` files directly from your file explorer without forcing database imports.

### 3. Ghostwriter

* **Style:** Minimalist Distraction-Free Editor
* **Platforms:** Windows, Linux
* **Best for:** Pure focused writing. Offers a clean UI with optional side-by-side preview and a "Focus Mode" that isolates your current sentence or paragraph.

### 4. VNote

* **Style:** Developer-oriented Markdown Editor
* **Platforms:** Windows, macOS, Linux
* **Best for:** A lightweight alternative built specifically for code snippet handling, Vim keybindings, and direct file tree navigation without heavy extensions.

### 5. Nimbalyst

* **Style:** WYSIWYG / Documentation Editor
* **Platforms:** Windows, macOS, Linux
* **Best for:** Fast rendering of specs, code blocks, and inline diagrams in a lightweight workspace.

---

**Summary**
If you want **real-time formatted text** without seeing Markdown syntax tags, **MarkText** is the top pick. If you prefer a traditional raw editor with minimal clutter, **Ghostwriter** or **Zettlr** are great alternatives.

Make sure to run your terminal as **Administrator** (*Ejecutar como administrador*) for these commands to execute without permission errors.

### 1. MarkText

```powershell
choco install marktext -y
```

### 2. Zettlr

```powershell
choco install zettlr -y
```

---

### Alternative Package Manager: `winget` (Standard Windows Package Manager)

Since Chocolatey doesn't host every niche open-source tool, you can also use **`winget`**, which comes built into Windows 10/11:

```powershell
# MarkText
winget install marktext.marktext

# Zettlr
winget install Zettlr.Zettlr

# VNote
winget install vnotex.vnote
```

> **Note on Ghostwriter:** Neither Chocolatey nor Winget currently maintain a Windows package for Ghostwriter. If you want to try Ghostwriter, you can download its portable build directly from the [KDE Download Page](https://ghostwriter.kde.org/download/).

---

MarkText actually supports a full directory tree sidebar—it is just waiting for you to select a directory.

In your screenshot, the sidebar is only displaying "Opened files". Click the **Open Folder** button at the bottom of the left sidebar (or use `Ctrl+Shift+O` / `Cmd+Shift+O`) to load your root directory. Once loaded, the sidebar will transform into a full file and folder tree view.

If you are looking for free, open-source alternatives with built-in folder tree navigation and distraction-free writing, here are the top options:

| **App**            | **Key Features**                                                                                             | **Best For**                                        |
| ------------------ | ------------------------------------------------------------------------------------------------------------ | --------------------------------------------------- |
| **Obsidian**       | Local Markdown files, folder tree, canvas, graph view, extensive plugin ecosystem. *(Free for personal use)* | Deep knowledge management & modular note-taking     |
| **Logseq**         | Open-source, local-first, supports hierarchy and tree structures, block-based outline mode.                  | Outlining, daily logs, and structured notes         |
| **Zettlr**         | Open-source, native folder tree file manager, tailored for academic citation & Markdown writing.             | Research, paper writing, & document organization    |
| **Foam / VS Code** | Open-source extension ecosystem, complete folder tree explorer, customizable live preview.                   | Developer-centric workflow & repository-based notes |
| **AppFlowy**       | Open-source Notion alternative, folder tree sidebar, board & table views, local storage.                     | Workspace organization & project documentation      |

---

Yes, you can launch MarkText from the terminal and pass the current directory to open it directly with the folder tree loaded.

### Direct Command

If `marktext` is added to your environment path:

Bash

```
marktext .
```

### Setting Up a Custom Shortcut / Alias

If `marktext` is not available globally in your path, set up a terminal alias to mimic the `code .` behavior.

#### macOS

Add this line to your `~/.zshrc` (or `~/.bash_profile`):

Bash

```
alias mark="open -a 'MarkText'"
```

- **Usage:** `mark .` (or `mark folder_name`)

#### Linux

Add a symlink or alias pointing to your executable or Flatpak package in `~/.bashrc`:

- **AppImage / Binary:**
  
  Bash

```
alias mark="marktext"
```

- **Flatpak:**
  
  Bash

```
alias mark="flatpak run com.github.marktext.marktext"
```

#### Windows (PowerShell)

Add a custom function to your PowerShell profile (`notepad $PROFILE`):

PowerShell

```
function mark {
    param([string]$Path = ".")
    Start-Process "marktext.exe" -ArgumentList (Resolve-Path $Path)
}
```

- **Usage:** `mark .`

---

Yes, you can launch MarkText from the terminal and pass the current directory to open it directly with the folder tree loaded.

### Direct Command

If `marktext` is added to your environment path:

Bash

```
marktext .
```

### Setting Up a Custom Shortcut / Alias

If `marktext` is not available globally in your path, set up a terminal alias to mimic the `code .` behavior.

#### macOS

Add this line to your `~/.zshrc` (or `~/.bash_profile`):

Bash

```
alias mark="open -a 'MarkText'"
```

- **Usage:** `mark .` (or `mark folder_name`)

#### Linux

Add a symlink or alias pointing to your executable or Flatpak package in `~/.bashrc`:

- **AppImage / Binary:**
  
  Bash

```
alias mark="marktext"
```

- **Flatpak:**
  
  Bash

```
alias mark="flatpak run com.github.marktext.marktext"
```

#### Windows (PowerShell)

Add a custom function to your PowerShell profile (`notepad $PROFILE`):

PowerShell

```
function mark {
    param([string]$Path = ".")
    Start-Process "marktext.exe" -ArgumentList (Resolve-Path $Path)
}
```

- **Usage:** `mark .`





---





MarkText is not in `Program Files` because Windows installs user-level apps in your personal `AppData` folder.

### Step 1: Find MarkText Executable

In the **Abrir con...** file dialog window currently open on your screen:

1. Click on the top address bar in that window where it currently says `Windows (C:) > Program Files`.

2. Paste this exact line into the address bar and press **Enter**:

  Plaintext

```
%LocalAppData%\Programs\marktext
```

3. You will see `MarkText.exe`. Select it and click **Abrir**.

*(Note: If you downloaded the Portable ZIP version instead, navigate to your **Descargas** or **Escritorio** folder where you extracted `marktext-win-x64` and select `marktext.exe` inside it).*

### Step 2: Make `marktext` Work in PowerShell

Once you locate `MarkText.exe`, link it to your terminal:

1. Open PowerShell and run:

  PowerShell

```
if (!(Test-Path $PROFILE)) { New-Item -Type File -Path $PROFILE -Force }
notepad $PROFILE
```

2. Paste this line into Notepad:

  PowerShell

```
function marktext { & "$env:LocalAppData\Programs\marktext\MarkText.exe" $args }
```

3. Save, close Notepad, and restart PowerShell. Now typing `marktext README.md` will launch it directly.



---





To set your editor as the **default application** for `.md` files in Windows File Explorer:

### Step 1: Set Default File Handler

1. Right-click any `.md` file.

2. Hover over **Abrir con** (Open with) and click **Elegir otra aplicación** (Choose another app) at the bottom of the sub-menu.

3. Scroll down in the pop-up list and click **Elegir una aplicación en el equipo** (Choose an app on your PC) or **Buscar otra aplicación en este equipo**.

4. Navigate to the executable location (e.g., `Zettlr.exe` in `C:\Program Files\Zettlr\Zettlr.exe` or `MarkText.exe` in your downloaded folder).

5. Select the `.exe` file and check the box that says **Siempre** (Always use this app to open .md files).

### Step 2: Fix Terminal Path for PowerShell

To figure out why the terminal command didn't work, run this command in PowerShell to locate where the editor `.exe` is saved on your drive:

PowerShell

```
Get-ChildItem -Path "C:\Program Files", "$env:LocalAppData\Programs" -Filter "*marktext*.exe" -Recurse -ErrorAction SilentlyContinue
```

*(If using Zettlr, replace `*marktext*.exe` with `*zettlr*.exe`).*

Once PowerShell prints the path to the `.exe`, copy it and add a temporary alias to your current session:

PowerShell

```
Set-Alias -Name marktext -Value "C:\Full\Path\To\marktext.exe"
```

You will then be able to open any file directly from your terminal by running `marktext README.md`.





---





This error happens because Windows hasn't added `marktext.exe` to your system environment `PATH` yet.

Here are the quickest ways to open your files from the terminal, depending on how you ended up installing or extracting MarkText:

### Method 1: Try Default Install Paths

If you installed MarkText using an setup installer, run one of these exact lines in PowerShell:

PowerShell

```
& "$env:LocalAppData\Programs\marktext\MarkText.exe" README.md
```

*or*

PowerShell

```
& "C:\Program Files\MarkText\MarkText.exe" README.md
```

### Method 2: Create a Permanent `marktext` Command

To make typing `marktext README.md` work permanently from any folder in PowerShell:

1. Create a PowerShell profile if you don't already have one:

  PowerShell

```
if (!(Test-Path $PROFILE)) { New-Item -Type File -Path $PROFILE -Force }
```

2. Open the profile file in Notepad:

  PowerShell

```
notepad $PROFILE
```

3. Paste **one** of the following lines into Notepad (replace the path if you are using the portable `.exe` folder):

  PowerShell

```
function marktext { & "$env:LocalAppData\Programs\marktext\MarkText.exe" $args }
```

4. **Save and close** Notepad, then restart PowerShell.

Now you can run:

PowerShell

```
marktext README.md



```





---