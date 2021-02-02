$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
Write-Host "Current script directory is $ScriptDir"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#unistall previous versions of virtual box 
choco uninstall virtualbox
choco install chocolatey-core.extension
choco install virtualbox --params "/NoDesktopShortcut /ExtensionPack"
choco upgrade virtualbox
VBoxManage import $ScriptDir\client.ova --options keepallmacs,importtovdi --vsys 0 --vmname "client"
VBoxManage startvm "client"
VBoxManage import $ScriptDir\gateway.ova --options keepallmacs,importtovdi --vsys 0 --vmname "gateway"
VBoxManage startvm "gateway"
#wget encrypted vm 
#wget aescrypt.exe
#then download files from various sources using VPN
#Then download encrypted virutalbox
#decrypt encrypted virtualbox using aescrpyt commands
Pause
