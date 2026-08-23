# WSL2 Architecture & Optimization Summary

This document details the complete architectural overhaul performed to transform a default WSL Ubuntu installation into an isolated, high-performance, native-like Linux workstation ("2nd PC") running inside Windows 11/10.

## 1. Hardware & System Resource Allocation

To prevent WSL2 from dynamically consuming all system RAM and CPU resources, dedicated hardware limits were enforced at the Hyper-V hypervisor level.

- **Configuration File:** `%USERPROFILE%\.wslconfig` (Windows User Root)

- **Configuration Code:**
  
  ```
  [wsl2]
  memory=8GB        # Caps maximum RAM for Ubuntu
  processors=4      # Reserves dedicated CPU cores
  swap=4GB          # Virtual memory disk buffer
  guiApplications=true # Enables native WSLg display pass-through
  ```

## 2. Environment Isolation & Systemd Activation

To decouple Linux from Windows and prevent Windows environment paths (`.exe` binaries) from leaking into Ubuntu:

- **Configuration File:** `/etc/wsl.conf` (Ubuntu System Config)

- **Configuration Code:**
  
  ```
  [boot]
  systemd = true    # Enables background Linux services (xrdp, docker)
  
  [interop]
  appendWindowsPath = false   # Blocks Windows PATH variables (cmd.exe, notepad.exe)
  enabled = true              # Preserves WSLg graphical rendering bridge
  ```

## 3. Native Linux Filesystem Migration (10x I/O Speedup)

- **Storage Protocol:**
  
  - Shifted all project repositories and workspace files from `/mnt/c/Users/raulc/` (which relies on the slow `9p`/`drvfs` cross-OS bridge) to `~` (`/home/raulc/`), sitting directly on the native Linux `ext4` virtual disk (`/dev/sdX`).

- **Validation Command:**
  
  ```
  df -T .
  ```
  
  *Expected Output:* `Filesystem: /dev/sdX` | `Type: ext4`

## 4. Full Graphical Desktop (XFCE4 + RDP on Port 3390)

To create a true "2nd PC" visual experience with a taskbar, menus, and visual file management:

### Packages Installed

```
sudo apt update && sudo apt install -y xfce4 xfce4-goodies xrdp
```

### Port Remapping

Changed default RDP port from `3389` to `3390` in `/etc/xrdp/xrdp.ini` to eliminate port conflicts with native Windows Remote Desktop:

```
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
```

### Wayland & Notification Daemon Fix

WSLg injects a `WAYLAND_DISPLAY` variable into the session. When XFCE starts over RDP (X11), this causes `xfce4-notifyd` (`wlr-layer-shell` protocol error) to crash with a dialogue box.

**Fix applied to `~/.xsession`:**

```
cat << 'EOF' > ~/.xsession
unset WAYLAND_DISPLAY
exec startxfce4
EOF
chmod +x ~/.xsession
```

### Automatic Service Enablement

```
sudo systemctl enable --now xrdp
```

## 5. Native Linux GUI Applications

Configured Linux-native software running independently from host Windows installations:

### VS Code (Native `.deb` Build)

- Installed native Linux package: `sudo apt install ./vscode.deb`.

- Added environment overrides to `~/.bashrc`:
  
  ```
  export DONT_PROMPT_WSL_INSTALL=1    # Suppresses Windows VS Code redirect prompt
  alias code="code --no-sandbox"      # Allows Chromium rendering under WSLg
  ```

### Linux File Manager (Explorer)

- Installed **Thunar** (XFCE File Manager):
  
  ```
  thunar .
  ```

### JetBrains PyCharm Community

- Installed natively via Snap inside Ubuntu:
  
  ```
  sudo snap install pycharm-community --classic
  pycharm-community .
  ```

## 6. GPU Acceleration, Sound, & Docker CUDA Integration

- **DirectX 12 GPU Pass-Through:**
  
  - Relies strictly on the Windows host NVIDIA driver (no Linux NVIDIA drivers installed inside Ubuntu).
  
  - Installed OpenGL translation utilities: `sudo apt install -y mesa-utils libgl1-mesa-dri`.
  
  - Verified via `glxinfo | grep OpenGL` (reports `D3D12 (NVIDIA GeForce...)`).

- **Audio Pass-Through:**
  
  - Audio routed to Windows via PulseAudio: `export PULSE_SERVER=/mnt/wslg/PulseServer`.

- **Docker & CUDA Setup:**
  
  - Native Docker CE running on systemd (`sudo systemctl enable --now docker`).
  
  - `nvidia-container-toolkit` installed to pass GPUs into containers (`docker run --rm --gpus all ubuntu nvidia-smi`).
  
  - PyTorch virtual environment set up with CUDA 12 (`torch.cuda.is_available()` returns `True`).

## 7. 1-Click Desktop Automation Scripts

Created Windows scripts to start Linux background services silently and launch a full-screen desktop session.

### File 1: `%USERPROFILE%\launch-linux-pc.bat`

```
@echo off
wsl -d Ubuntu -u root service xrdp status >nul 2>&1
if %errorlevel% neq 0 (
    wsl -d Ubuntu -u root service xrdp start
)
mstsc /v:localhost:3390 /f
```

### File 2: `%USERPROFILE%\launch-silent.vbs`

```
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd /c ""%USERPROFILE%\launch-linux-pc.bat""", 0, False
```

### Windows Desktop Shortcut

- Linked to `launch-silent.vbs` on the Windows Desktop and renamed to **Ubuntu Desktop PC**.

## 8. Diagnostic & Verification Cheat Sheet

| **Task**                  | **Command**              | **Target Result**               |
| ------------------------- | ------------------------ | ------------------------------- |
| **Verify Username**       | `whoami`                 | `raulc`                         |
| **Verify Filesystem**     | `df -T .`                | `ext4`                          |
| **Test Path Isolation**   | `which cmd.exe`          | *(Blank output)*                |
| **Verify GPU Rendering**  | `glxinfo \| grep OpenGL` | `D3D12 (NVIDIA...)`             |
| **Verify CUDA Status**    | `nvidia-smi`             | GPU Table with Driver Version   |
| **Launch File Explorer**  | `thunar .`               | GUI Window in current directory |
| **Launch Native VS Code** | `code .`                 | Native Linux VS Code Window     |
| **Launch Native PyCharm** | `pycharm-community .`    | Native Linux PyCharm IDE        |
