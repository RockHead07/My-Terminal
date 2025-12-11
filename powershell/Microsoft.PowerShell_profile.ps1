# --- UTF-8 ---
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

# --- Fastfetch ---
Clear-Host
fastfetch -c "$HOME/.config/fastfetch/config.jsonc"

$esc = "$([char]27)["

Write-Host "$esc" + "37m██████ ▄▄ ▄▄ ▄▄  ▄▄▄▄   ██  ▄▄▄▄   ██████ ▄▄▄▄▄ ▄▄▄▄  ▄▄   ▄▄ ▄▄ ▄▄  ▄▄  ▄▄▄  ▄▄"
Write-Host "$esc" + "36m  ██   ██▄██ ██ ███▄▄   ██ ███▄▄     ██   ██▄▄  ██▄█▄ ██▀▄▀██ ██ ███▄██ ██▀██ ██"
Write-Host "$esc" + "32m  ██   ██ ██ ██ ▄▄██▀   ██ ▄▄██▀     ██   ██▄▄▄ ██ ██ ██   ██ ██ ██ ▀██ ██▀██ ██▄▄▄"

# Reset warna
Write-Host "$esc" + "0m"
# --- End Fastfetch ---