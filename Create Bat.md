Create .BAT

PowerShell excludes the current working directory from its execution path (`PATH`) by default as a security feature. Unlike traditional Command Prompt (`cmd.exe`), PowerShell requires an explicit path prefix to run files in your active folder to prevent accidental execution of unauthorized scripts.

**Quick Fix**

Prefix the file name with `.\` to explicitly target the current directory:

PowerShell

```
.\init_git.bat
```

**Alternative Options**

- **Run via CMD:** Delegate the execution directly to Command Prompt from inside your PowerShell session:
  
  PowerShell

```
cmd /c init_git.bat
```

- **Switch to Command Prompt:** Type `cmd` in PowerShell to switch to standard CMD, where typing `init_git.bat` without `.\` works by default.

---

Save the following script as `make_web_project.bat`:

DOS

```
@echo off
set /p PROJ_NAME="Enter project name: "

if "%PROJ_NAME%"=="" (
    echo Error: Project name cannot be empty.
    pause
    exit /b 1
)

:: Create main folder and switch into it
mkdir "%PROJ_NAME%"
cd "%PROJ_NAME%"

:: Create subdirectories
mkdir css js assets

:: Create README.md
(
echo # %PROJ_NAME%
echo.
echo Basic web project setup.
echo.
echo ## Structure
echo - `css/` - Stylesheets
echo - `js/` - JavaScript source code
echo - `assets/` - Images and visual media
) > README.md

:: Create basic index.html
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>%PROJ_NAME%^</title^>
echo     ^<link rel="stylesheet" href="css/style.css"^>
echo ^</head^>
echo ^<body^>
echo     ^<h1^>Welcome to %PROJ_NAME%^</h1^>
echo     ^<script src="js/app.js"^>^</script^>
echo ^</body^>
echo ^</html^>
) > index.html

:: Create empty default asset files
type nul > css\style.css
type nul > js\app.js

echo.
echo Success! Web project '%PROJ_NAME%' created successfully.
pause
```

**How to Run It**

1. Save the file inside the directory where you store your projects.

2. In **PowerShell**, execute it with:
   
   PowerShell

```
.\make_web_project.bat
```

3. Type your project name when prompted and hit `Enter`.

---

Save this updated code as `make_web_project.bat`:

DOS

```
@echo off
set /p PROJ_NAME="Enter project name: "

if "%PROJ_NAME%"=="" (
    echo Error: Project name cannot be empty.
    pause
    exit /b 1
)

:: Create main folder and switch into it
mkdir "%PROJ_NAME%"
cd "%PROJ_NAME%"

:: Create subdirectories
mkdir css js assets

:: Create README.md
(
echo # %PROJ_NAME%
echo.
echo Basic web project setup.
echo.
echo ## Structure
echo - `css/` - Stylesheets
echo - `js/` - JavaScript source code
echo - `assets/` - Images and visual media
) > README.md

:: Create basic index.html
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>%PROJ_NAME%^</title^>
echo     ^<link rel="stylesheet" href="css/style.css"^>
echo ^</head^>
echo ^<body^>
echo     ^<h1^>Welcome to %PROJ_NAME%^</h1^>
echo     ^<script src="js/app.js"^>^</script^>
echo ^</body^>
echo ^</html^>
) > index.html

:: Create empty default asset files
type nul > css\style.css
type nul > js\app.js

:: Create standard .gitignore
(
echo # OS metadata
echo .DS_Store
echo Thumbs.db
echo.
echo # Editors and IDEs
echo .vscode/
echo .idea/
echo *.swp
echo.
echo # Environment and dependencies
echo node_modules/
echo .env
) > .gitignore

:: Git initialization and initial commit
git init
git add .
git commit -m "Initial commit: scaffold web project structure"

echo.
echo Success! Web project '%PROJ_NAME%' initialized with Git.
pause
```

.bat

```Powershell
echo Create standard .gitignore

:: Create standard .gitignore
(
echo # OS metadata
echo .DS_Store
echo Thumbs.db
echo.
echo # Editors and IDEs
echo .vscode/
echo .idea/
echo *.swp
echo.
echo # Environment and dependencies
echo node_modules/
echo .env
) > .gitignore
```

```

```

---



The cleanest way to automate creating and pushing a repository to GitHub from a batch script is using the official **GitHub CLI (`gh`)**. If you prefer not to install extra tools, you can prompt for your GitHub username and link a manually created repository using standard **Git CLI** commands.

### Option 1: Automated Creation via GitHub CLI (Recommended)

This method automatically creates the remote repository on GitHub, attaches the remote `origin`, and pushes your initial commit without opening a browser.

**Prerequisite:** Install GitHub CLI (`winget install GitHub.cli` in PowerShell) and authenticate once by running `gh auth login`.

Add this block to the bottom of your batch script:

DOS

```
:: Create GitHub repository and push code
git branch -M main
gh repo create "%PROJ_NAME%" --public --source=. --remote=origin --push
```

*(Replace `--public` with `--private` if you prefer private repositories by default).*

### Option 2: Standard Git CLI (Prompt for GitHub URL)

If you prefer creating the repository via the GitHub web interface first, prompt for your GitHub username in the script to construct the remote URL:

DOS

```
set /p GH_USER="Enter your GitHub username: "

git branch -M main
git remote add origin https://github.com/%GH_USER%/%PROJ_NAME%.git
git push -u origin main
```

### Complete Updated Batch Script (Using GitHub CLI)

DOS

```
@echo off
set /p PROJ_NAME="Enter project name: "

if "%PROJ_NAME%"=="" (
    echo Error: Project name cannot be empty.
    pause
    exit /b 1
)

:: Create main folder and switch into it
mkdir "%PROJ_NAME%"
cd "%PROJ_NAME%"

:: Create subdirectories
mkdir css js assets

:: Create README.md
(
echo # %PROJ_NAME%
echo.
echo Basic web project setup.
echo.
echo ## Structure
echo - `css/` - Stylesheets
echo - `js/` - JavaScript source code
echo - `assets/` - Images and visual media
) > README.md

:: Create basic index.html
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>%PROJ_NAME%^</title^>
echo     ^<link rel="stylesheet" href="css/style.css"^>
echo ^</head^>
echo ^<body^>
echo     ^<h1^>Welcome to %PROJ_NAME%^</h1^>
echo     ^<script src="js/app.js"^>^</script^>
echo ^</body^>
echo ^</html^>
) > index.html

:: Create empty default asset files
type nul > css\style.css
type nul > js\app.js

:: Create standard .gitignore
(
echo # OS metadata
echo .DS_Store
echo Thumbs.db
echo.
echo # Editors and IDEs
echo .vscode/
echo .idea/
echo *.swp
echo.
echo # Environment and dependencies
echo node_modules/
echo .env
) > .gitignore

:: Git initialization and local commit
git init
git branch -M main
git add .
git commit -m "Initial commit: scaffold web project structure"

:: Create public repo on GitHub and push code
gh repo create "%PROJ_NAME%" --public --source=. --remote=origin --push

echo.
echo Success! Web project '%PROJ_NAME%' created and published to GitHub.
pause
```
