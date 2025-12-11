# My Windows Terminal Configuration (Dotfiles)

> [!NOTE]
> This repository contains my full Windows terminal setup, including PowerShell profile, Fastfetch settings, custom ASCII banners, and Windows Terminal configuration and all stored in one portable dotfiles structure.
>

This configurations will allows me to restore my entire terminal environment on any device in under 10 seconds.

### 📷 Preview

Here's how my terminal looks currently:

<img width="1918" height="1078" alt="Terminal Preview" src="https://github.com/user-attachments/assets/cf6d9e27-3a6e-4166-b604-669206a985d7" />

### 🔧 Tech Stack Used

- PowerShell 7.x (main shell)

- Fastfetch (system info + theme)

- Capcin theme (Fastfetch preset)

- JetBrains Mono Nerd Font (terminal + prompt)

- Windows Terminal (host application)

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
>**Note: ** Path inside `install.ps1` assume default locations. Modify `$FastfetchPath` or Windows Terminal path if tour installation differs.

### Installation 

##### 1. Clone the Repo:

```powershell
git clone https://github.com/RockHead07/My-Terminal.git
cd My-Terminal
```

##### 2. Run the Installer (*PowerShell 7.x Required*):

```powershell
.\install.ps1
```