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