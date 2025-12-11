# ======================================================
# Install Script for My-Terminal Dotfiles
# Compatible: PowerShell 7.x
# ======================================================

# --- Check PowerShell Version ---
$PSVersion = $PSVersionTable.PSVersion
if ($PSVersion.Major -lt 7) {
    Write-Host "⚠ PowerShell versi 7 ke atas diperlukan!" -ForegroundColor Yellow
    Write-Host "Install dengan: winget install Microsoft.PowerShell" -ForegroundColor Yellow
    exit 1
}

# --- Colors for Output ---
function Write-Success { Write-Host "✓ $args" -ForegroundColor Green }
function Write-Error_ { Write-Host "✗ $args" -ForegroundColor Red }
function Write-Info { Write-Host "ℹ $args" -ForegroundColor Cyan }
function Write-Warning_ { Write-Host "⚠ $args" -ForegroundColor Yellow }

# --- Set Execution Policy Temporarily ---
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force | Out-Null

# --- Define Repo & Target Paths ---
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoWT = Join-Path $RepoRoot "windows-terminal\settings.json"
$RepoPS = Join-Path $RepoRoot "powershell\Microsoft.PowerShell_profile.ps1"
$RepoFF = Join-Path $RepoRoot "fastfetch"

# Windows Terminal Path (Admin required)
$WTPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# PowerShell Profile
$PSProfile = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

# Fastfetch
$FastfetchPath = "$HOME\.config\fastfetch"  # Ubah jika Fastfetch ada di lokasi lain

# Backup folder
$BackupDir = Join-Path $RepoRoot "backup\$(Get-Date -Format 'yyyy-MM-dd_HHmmss')"
New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null

# --- Backup Function ---
function Backup-File($filePath, $desc) {
    if (Test-Path $filePath) {
        Copy-Item $filePath (Join-Path $BackupDir (Split-Path $filePath -Leaf)) -Force
        Write-Success "$desc dibackup"
    }
}

# Backup configs
Backup-File $WTPath "Windows Terminal settings.json"
Backup-File $PSProfile "PowerShell Profile"
if (Test-Path $FastfetchPath) {
    Copy-Item $FastfetchPath (Join-Path $BackupDir "fastfetch") -Recurse -Force
    Write-Success "Fastfetch folder dibackup"
}

# --- Prompt Overwrite Function ---
function Prompt-Copy($source, $dest, $desc) {
    if (Test-Path $dest) {
        $ans = Read-Host "File $desc sudah ada. Overwrite? (Y/N)"
        if ($ans -notin @("Y","y")) { Write-Info "$desc dilewati"; return }
    }
    Copy-Item $source $dest -Recurse -Force
    Write-Success "$desc dikopi"
}

# --- Copy Configs ---
Prompt-Copy $RepoWT $WTPath "Windows Terminal settings.json"
Prompt-Copy $RepoPS $PSProfile "PowerShell profile"
if (-not (Test-Path $FastfetchPath)) { New-Item -ItemType Directory -Path $FastfetchPath -Force | Out-Null }
Get-ChildItem $RepoFF | Copy-Item -Destination $FastfetchPath -Recurse -Force
Write-Success "Fastfetch configs dikopi"

# --- Check Dependencies ---
if (-not (Get-Command fastfetch -ErrorAction SilentlyContinue)) {
    Write-Warning_ "Fastfetch tidak terinstall"
    Write-Info "Install dengan: winget install fastfetch"
}

# Check Font Nerd
$Fonts = Get-ChildItem "C:\Windows\Fonts" -Filter "*NerdFont*.ttf"
if ($Fonts.Count -eq 0) {
    Write-Warning_ "Nerd Font tidak terdeteksi. Silakan install salah satu dari https://www.nerdfonts.com/font-downloads"
}

# --- Installation Summary ---
Write-Host "`n========== INSTALLATION SELESAI ==========" -ForegroundColor Green
Write-Host "Backup tersimpan di: $BackupDir" -ForegroundColor Cyan
Write-Host "Langkah selanjutnya:" -ForegroundColor Cyan
Write-Host "  1. Close Windows Terminal sepenuhnya"
Write-Host "  2. Buka kembali Windows Terminal"
Write-Host "  3. Jalankan: `$PROFILE | cat` untuk verifikasi profile"

