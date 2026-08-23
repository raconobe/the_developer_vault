Migrating from standard `pip`

 Migrating from standard `pip` and `virtualenv` to **`uv`** simplifies your workflow and speeds up package installation by up to 100x.

You can migrate using two main approaches:

1. **Modern `uv` Workflow (Recommended):** Moves your dependencies to a modern `pyproject.toml` and generates an exact `uv.lock` file.

2. **Drop-in `uv pip` Replacement:** Keeps your existing `requirements.txt` structure but uses `uv` under the hood for speed.

### Path 1: Modern `uv` Workflow (Recommended)

**1.Install uv on your machine:**Run outside any virtual environment.

Install `uv` globally using the official installer script or package manager:

- **macOS / Linux:**

Bash

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- **Windows (PowerShell):**

PowerShell

```
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

- **Via pip (Alternative):**

Bash

```
pip install uv
```

**2.Remove your existing virtual environment:**Prerequisite before creating a uv environment.

Deactivate your active virtual environment if one is running, then delete the old `.venv` directory to prevent leftover package conflicts:

Bash

```
deactivate
rm -rf .venv  # On Windows PowerShell: Remove-Item -Recurse -Force .venv
```

**3.Initialize uv in your project directory:**

Navigate to your existing project root folder and run:

Bash

```
uv init --bare
```

*Note: Using `--bare` initializes `uv` management in your existing directory without creating sample template files.*

**4.Import existing dependencies from requirements.txt:**

Convert your `requirements.txt` file into a managed `pyproject.toml` and create a lockfile (`uv.lock`) automatically:

Bash

```
uv add -r requirements.txt
```

If you also have a development requirements file (e.g., `requirements-dev.txt`), add those as development dependencies:

Bash

```
uv add --dev -r requirements-dev.txt
```

This command automatically creates a fresh `.venv` directory and installs all dependencies into it.

**5.Verify installation and run your project:**

You can now run scripts directly through `uv`, which automatically uses the `.venv` in your project without needing manual activation:

Bash

```
uv run python main.py
```

To see all installed packages in your environment:

Bash

```
uv tree
```

### Path 2: Drop-In Replacement Workflow (`uv pip`)

If you want to keep your project setup exactly as-is (`requirements.txt` without `pyproject.toml`), you can use `uv pip` as a direct substitute for standard `pip`:

Bash

```
# 1. Create a virtual environment using uv
uv venv

# 2. Activate the environment (Standard step)
# macOS/Linux: source .venv/bin/activate
# Windows: .venv\Scripts\activate

# 3. Install your requirements using uv pip instead of pip
uv pip install -r requirements.txt
```

### VS Code Update

Since `uv` creates the `.venv` folder in the root of your project directory, your existing `.vscode/settings.json` file will work automatically without changes:

JSON

```
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/Scripts/python.exe",
  "python.terminal.activateEnvironment": true
}



```







---







`uv` manages Python versions directly, eliminating the need for external managers like `pyenv`. It automatically downloads standalone Python builds on demand.

**1. Install Python Versions**

Download any version of Python without touching your system's global installation:

Bash

```
# Install specific Python versions
uv python install 3.11 3.12 3.13

# List installed and available Python versions
uv python list
```

**2. Pin a Version to Your Project Directory**

Lock down the active Python version for your current workspace:

Bash

```
uv python pin 3.12
```

- This creates a `.python-version` file in your project folder.

- Run `uv sync` afterward to update your `.venv` environment to match the pinned version.

**3. Create a `.venv` with a Specific Python Version**

Create a virtual environment using any installed or uninstalled version (if uninstalled, `uv` downloads it automatically):

Bash

```
# Create a venv using Python 3.11
uv venv --python 3.11

# Create a venv using a specific patch release
uv venv --python 3.12.3
```

**4. Run One-off Scripts on a Different Python Version**

Test code on another version without changing your project settings or re-creating your `.venv`:

Bash

```
# Run a script using Python 3.10
uv run --python 3.10 main.py

# Launch an interactive shell on PyPy 3.8
uv run --python pypy@3.8 -- python
```







.---

---





Set the **`requires-python`** key under the `[project]` table in your `pyproject.toml` file.

Ini, TOML

```
[project]
name = "my-project"
version = "0.1.0"
requires-python = ">=3.11"
```

**Common Version Specifiers**

| **Constraint Syntax**               | **Meaning**                                               |
| ----------------------------------- | --------------------------------------------------------- |
| `requires-python = ">=3.11"`        | Python 3.11 or any newer version                          |
| `requires-python = ">=3.10, <3.13"` | Python 3.10 up to (but excluding) 3.13                    |
| `requires-python = "~=3.11.0"`      | Any patch update in the 3.11 series (`>=3.11.0, <3.12.0`) |
| `requires-python = "==3.12.*"`      | Any release within Python 3.12                            |

**Setting it automatically via CLI**

When initializing a new project with `uv`, pass the `--python` flag to preconfigure `requires-python`:

Bash

```
uv init --python ">=3.11"
```

**How `uv` Uses `requires-python`**

- **Dependency Resolution:** `uv lock` checks every dependency to make sure it has compatible wheels/packages for all Python versions allowed by your `requires-python` range.

- **Environment Matching:** When you run `uv sync` or `uv venv`, `uv` automatically downloads and uses a Python executable that satisfies the constraint.

---





By default, `uv.lock` is a **universal lockfile**—it resolves dependencies for all possible operating systems, architectures, and Python versions simultaneously.

To restrict or mandate specific OS and architecture targets, configure PEP 508 environment markers in your `pyproject.toml` file under the `[tool.uv]` table.

### 1. Restrict Resolved Environments (`environments`)

Use `environments` to narrow down the target platforms `uv` will solve for. This speeds up resolution and avoids solving for unsupported platforms (e.g., skipping Windows if you only build for Linux and macOS).

Ini, TOML

```
[tool.uv]
environments = [
  "sys_platform == 'linux' and platform_machine == 'x86_64'",
  "sys_platform == 'darwin' and platform_machine == 'arm64'",
  "sys_platform == 'win32'"
]
```

### 2. Force Support for Wheel-Only Packages (`required-environments`)

Some packages (like PyTorch or specific GPU libraries) do not provide source distributions (`sdist`) and only publish pre-built binary wheels for specific platforms. Use `required-environments` to ensure `uv` strictly fails if a target platform is missing a compatible binary wheel.

Ini, TOML

```
[tool.uv]
required-environments = [
  "sys_platform == 'linux' and platform_machine == 'x86_64'"
]
```

### Key PEP 508 Markers

| **Marker**             | **Description**        | **Common Values**                                  |
| ---------------------- | ---------------------- | -------------------------------------------------- |
| **`sys_platform`**     | Operating System       | `'linux'`, `'darwin'` (macOS), `'win32'` (Windows) |
| **`platform_machine`** | CPU Architecture       | `'x86_64'`, `'arm64'` / `'aarch64'`, `'AMD64'`     |
| **`python_version`**   | Python Runtime Version | `'3.11'`, `'3.12'`                                 |

### CLI Overrides for `uv pip` Workflows

If you are compiling requirements files via CLI using `uv pip compile`, pass explicit target platform flags:

Bash

```
# Compile a requirements.txt specifically for Linux x86_64
uv pip compile requirements.in --python-platform x86_64-unknown-linux-gnu -o requirements.txt


```







---



Yes, all of these tools have official websites and documentation:

**Official Tool Websites**

- **`uv`**: [docs.astral.sh/uv](https://docs.astral.sh/uv)

- **Poetry**: [python-poetry.org](https://python-poetry.org/)

- **Pixi**: [pixi.sh](https://pixi.sh/)

- **Conda**: [docs.conda.io](https://docs.conda.io/)

### Is `venv` really dead?

You are spot-on in spirit: manually typing `python -m venv .venv`, sourcing activation scripts, and manually editing `requirements.txt` is considered an outdated workflow in modern Python development.

Here is what "real life" development looks like today:

- **Automated `.venv` (The Modern Standard):** Modern managers like `uv` or `Poetry` still build a `.venv` folder under the hood, but they manage it for you completely invisibly. You run `uv run main.py`, and it automatically creates, updates, and activates the environment without you touching terminal paths.

- **Dev Containers (`containers.dev`):** Many engineering teams replace local virtual environments entirely with Docker or VS Code Dev Containers. Your entire operating system environment, Python version, and system packages are defined in code and run inside an isolated container.

- **Cloud & Ephemeral Environments:** Developers increasingly use cloud IDEs (like GitHub Codespaces or Replit) or serverless Python runners (like Modal), where environments are created and destroyed in the cloud on demand.

Manual `venv` isn't dead underneath the hood, but manually managing it yourself certainly is. Modern tools handle the plumbing so you can focus on writing code.
