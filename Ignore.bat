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