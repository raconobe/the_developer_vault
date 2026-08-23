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