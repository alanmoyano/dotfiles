# Prompt
oh-my-posh init pwsh --config "$HOME\.config\dotfiles\alan.omp.json" | Invoke-Expression

# Icons
Import-Module Terminal-Icons

# Cargar Alias
Import-Module -Name HackF5.ProfileAlias -Force -Global -ErrorAction SilentlyContinue

# PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
Set-PsFzfOption -AltCCommand $commandOverride

# Alias Básicos
Set-Alias touch New-Item
Set-ProfileAlias rf "rm -Recurse -Force #{*}" -Bash -Force > nul

# Alias del ls
Set-ProfileAlias ls "eza --icons=always #{*}" -Bash -Force > nul
Set-ProfileAlias ll "eza --icons=always -lh #{*}" -Bash -Force > nul
Set-ProfileAlias lt "eza --icons=always -lhTL=2 #{*}" -Bash -Force > nul
Set-ProfileAlias l "eza --icons=always -lah #{*}" -Bash -Force > nul

# Alias de Git
Set-Alias gg git
Set-ProfileAlias gga 'git add #{*}' -Bash -Force > nul
Set-ProfileAlias ggc 'git commit -m #{*}' -Bash -Force > nul
Set-ProfileAlias ggd 'git diff #{*}' -Bash -Force > nul
Set-ProfileAlias ggf 'git fetch #{*}' -Bash -Force > nul
Set-ProfileAlias ggpll 'git pull #{*}' -Bash -Force > nul
Set-ProfileAlias ggpsh 'git push #{*}' -Bash -Force > nul
Set-ProfileAlias ggs 'git status #{*}' -Bash -Force > nul

# Utilities
function which($command){
	Get-Command -Name $command -ErrorAction SilentlyContinue |
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function .dot(){
	Set-Location ~\.config\dotfiles
}

function .lnx(){
	Set-Location \\wsl.localhost\Ubuntu\home\alan
}
