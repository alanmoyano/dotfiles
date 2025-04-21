# Set the console’s encoding to UTF‑8 for input and output
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
[Console]::InputEncoding  = [System.Text.UTF8Encoding]::new()

# Set the LANG environment variable if some tools rely on it
$env:LANG = "es-ES.UTF-8"

# Prompt
oh-my-posh init pwsh --config "$HOME\.config\dotfiles\alan.omp.json" | Invoke-Expression

# PSFzf
$env:FZF_DEFAULT_COMMAND = "fd --type file --strip-cwd-prefix"
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
Set-PsFzfOption -AltCCommand $commandOverride

# Alias Básicos
Set-Alias touch New-Item
Set-Alias unzip Expand-Archive
Set-Alias open Invoke-Item

function rf {
	rm -Recurse -Force $args
}

# Alias del ls
Remove-Alias ls -ErrorAction SilentlyContinue
function ls {
  eza --icons=always --group-directories-first $args
}

function ll {
  eza --icons=always --group-directories-first -lh --git $args
}

function lt{
	eza --icons=always --group-directories-first -lhTL=2 --git $args
}

function l{
	eza --icons=always --group-directories-first -lah --git $args
}

# Alias de Git
Set-Alias gg git
function gga{
	git add $args
}

function ggc{
	git commit -m $args
}

function ggd{
	git diff $args
}

function ggf{
	git fetch $args
}

function ggpll{
	git pull $args
}

function ggpsh{
	git push $args
}

function ggs{
	git status $args
}

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

$env:YAZI_FILE_ONE="C:\Program Files\Git\usr\bin\file.exe"

fnm env --use-on-cd | Out-String | Invoke-Expression
fnm completions | Out-String | Invoke-Expression
uv generate-shell-completion powershell | Out-String | Invoke-Expression
zoxide init powershell | Out-String | Invoke-Expression
