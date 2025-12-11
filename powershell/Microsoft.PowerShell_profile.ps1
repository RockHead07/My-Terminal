# --- UTF-8 Encoding ---
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

# --- Fastfetch Execution ---
Clear-Host
try {
    if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
        $fastfetchConfig = "$HOME/.config/fastfetch/config.jsonc"
        if (Test-Path $fastfetchConfig) {
            fastfetch -c $fastfetchConfig
        } else {
            Write-Warning "Fastfetch config not found at: $fastfetchConfig"
        }
    } else {
        Write-Warning "Fastfetch is not installed. Install via: winget install fastfetch"
    }
}
catch {
    Write-Error "Error running fastfetch: $_"
}

# --- ASCII Art Banner ---
$esc = "`e["

Write-Host "$esc" + "37m██████ ▄▄ ▄▄ ▄▄  ▄▄▄▄   ██  ▄▄▄▄   ██████ ▄▄▄▄▄ ▄▄▄▄  ▄▄   ▄▄ ▄▄ ▄▄  ▄▄  ▄▄▄  ▄▄"
Write-Host "$esc" + "36m  ██   ██▄██ ██ ███▄▄   ██ ███▄▄     ██   ██▄▄  ██▄█▄ ██▀▄▀██ ██ ███▄██ ██▀██ ██"
Write-Host "$esc" + "32m  ██   ██ ██ ██ ▄▄██▀   ██ ▄▄██▀     ██   ██▄▄▄ ██ ██ ██   ██ ██ ██ ▀██ ██▀██ ██▄▄▄"

# Reset colors
Write-Host "$esc" + "0m"
# --- End Fastfetch ---
