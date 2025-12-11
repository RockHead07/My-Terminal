# --- UTF-8 ---
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

# --- Fastfetch ---
Clear-Host
try {
	if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
		$fastfetchConfig = "$HOME/.config/fastfetch/config.jsonc"
		if (Test-Path $fastfetchConfig) {
			fastfetch -c $fastfetchConfig
		} else {
			Write-Warning "Fastfetch config tidak ditemukan di: $fastfetchConfig"
		}
	} else {
		Write-Warning "Fastfetch tidak terinstall. Install dengan: winget install fastfetch"
	}
}
catch {
	Write-Error "Error menjalankan fastfetch: $_"
}

# --- ASCII Art Banner ---
$esc = "`e["

Write-Host "$esc" + "37m██████ ▄▄ ▄▄ ▄▄  ▄▄▄▄   ██  ▄▄▄▄   ██████ ▄▄▄▄▄ ▄▄▄▄  ▄▄   ▄▄ ▄▄ ▄▄  ▄▄  ▄▄▄  ▄▄"
Write-Host "$esc" + "36m  ██   ██▄██ ██ ███▄▄   ██ ███▄▄     ██   ██▄▄  ██▄█▄ ██▀▄▀██ ██ ███▄██ ██▀██ ██"
Write-Host "$esc" + "32m  ██   ██ ██ ██ ▄▄██▀   ██ ▄▄██▀     ██   ██▄▄▄ ██ ██ ██   ██ ██ ██ ▀██ ██▀██ ██▄▄▄"

# Reset warna
Write-Host "$esc" + "0m"
# --- End Fastfetch ---