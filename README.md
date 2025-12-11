# My Personal Windows Terminal Configuration

![PowerShell](https://img.shields.io/badge/PowerShell-7.x-blue)
![Fastfetch](https://img.shields.io/badge/Fastfetch-enabled-green)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)

> [!NOTE]
> This repository contains my full Windows terminal setup, including PowerShell profile, Fastfetch settings, custom ASCII banners, and Windows Terminal configuration and all stored in one portable script structure.
>

This configurations will allows me to restore my entire terminal environment on any device in under 10 seconds.

### 📷 Preview

Here's how my terminal looks currently:

<img width="1918" height="1078" alt="Terminal Preview" src="https://github.com/user-attachments/assets/cf6d9e27-3a6e-4166-b604-669206a985d7" />

### 🔧 Tech Stack Used

- **PowerShell 7.x** – primary shell with UTF-8 support  
- **Fastfetch** – system info display & theming  
- **Custom ASCII Banner** – stored in `fastfetch/ascii.txt`  
- **JetBrains Mono Nerd Font** (or any Nerd Font) – recommended for proper glyphs  
- **Windows Terminal** – host application

### 📂 Folder Structure

```python
MyTerminal/
│── install.ps1                  # Installer script
│── windows-terminal/
│    └── settings.json           # Windows Terminal configuration
│── powershell/
│    └── Microsoft.PowerShell_profile.ps1  # PowerShell profile
└── fastfetch/
    ├── config.jsonc             # Fastfetch configuration
    └── ascii.txt                # Custom ASCII banner
```

>[!CAUTION]
>**Note:** Path inside `install.ps1` assume default locations. Modify `$FastfetchPath` or Windows Terminal path if tour installation differs.

### Installation 

>[!WARNING]
>Before running the installer, ensure:
> - **Windows Terminal** already installed, if not install it from *Microsoft Store*
> - **PowerShell 7.x** installed 
> - **Fastfetch** installed 
> - **Nerd Font** installed (⚠️ Fonts other than *JetBrainsMono* are fine, but *Nerd Font* is required for propher glyphs)

##### Installation required for Windows

Fastfetch

```powershell
winget install fastfetch    # via winget
scoop install fastfetch     # via scoop
choco install fastfetch     # via Chocolatey
```



##### 1. Clone the Repo:

```powershell
git clone https://github.com/RockHead07/My-Terminal.git
cd My-Terminal
```

##### 2. Run the Installer (*PowerShell 7.x Required*):

```powershell
.\install.ps1
```

The script will:

- Backup existing configs (Windows Terminal, PowerShell profile, Fastfetch folder)
- Copy repository configs to your system
- Verify installation and display log file location

 If a file already exists, the installer will prompt before overwriting.

 ### Configuration Notes

 - `$FastFetchPath` in `install.ps1` can be updated if **Fastfetch** isinstalled elsewhere
 - PowerShell profile: `$PROFILE` path is automatically detected for PowerShell 7
 - ASCII banner: Modify `fastfetch/ascii.txt` to customize logo display
 - Font: any Nerd Font can be used; adjust `settings.json` accordingly

### Backup & Restore

- All existing configs are backed up in `backup/YYYY-MM-DD_HHMMSS/`
- Installation log is saved as `install.log` in the backup folder
- To restore, manually copy files from the backup folder to original paths

### Customization Tips

- **Theme:** edit `settings.json` in `"schemes"` to change colors
- **Fonts:** change `"face"` in `settings.json` under `"defaults"`
- **ASCII Art:** edit `fastfetch/ascii.txt` and update `config.jsonc` `"logo.source"` if needed
- **Modules:** modify `config.jsonc` in `"modules"` to add/remove Fastfetch modules

### Troubleshooting

- **Fastfetch not found:** ensure the *Fastfetch* installed! `winget install fastfetch`
- **PowerShell < 7:** update using `winget install Microsoft.Powershell`
- **Incorrect font:** install a `Nerd Font`, then configure it on windows Windows Terminal
- **ANSI/UTF-8 issues**: ensure PowerShell profile sets `[Console]::OutputEncoding = [System.Text.Ecnoding]::UTF8`
- **Permissions:** run the installer as **administrator** if you see access errors copying `settings.json`

>[!NOTES]
>For extra scalable configuration, you can also check the creator of Fastfetch GitHub https://github.com/fastfetch-cli/fastfetch?tab=readme-ov-file 