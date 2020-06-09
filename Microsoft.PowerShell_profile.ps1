Import-Module posh-git
Import-Module oh-my-posh


#function Test-Administrator {
#    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
#    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
#}

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward






Import-Module -Name Terminal-Icons

Set-Theme Robbyrussell


Add-WindowsPSModulePath

Import-VisualStudioVars 2017 amd64
Invoke-BatchFile "D:\opt\IntelSWTools\parallel_studio_xe_2019\compilers_and_libraries_2019\windows\bin\compilervars.bat" intel64 vs2017

Set-PSReadLineOption -EditMode Emacs

Import-Module Get-ChildItemColor
If (-Not (Test-Path Variable:PSise)) {  # Only run this in the console and not in the ISE
    Import-Module Get-ChildItemColor

    Set-Alias l Get-ChildItem -option AllScope
    Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'


Set-Alias -name vim -value nvim
#Set-Alias -name less -value C:\Users\n_asanbekov\Documents\PowerShell\Modules\Pscx\3.3.2\Apps\less.exe
#Set-Alias -name cling -value "kali run /opt/cling/bin/cling -std=c++17"
function cling { kali run /opt/cling/bin/cling -std=c++17 }
clear
#Invoke-Expression (&starship init powershell)

#Import-Module BitsTransfer
#Start-BitsTransfer -Source $Source -Destination $Destination -Description "Backup" -DisplayName "Backup"


#Write-Ascii -fore darkgreen "   Powershell Core"

#Write-Host -ForegroundColor DarkYellow "                                                   _oo0oo_"
#Write-Host -ForegroundColor DarkYellow "                                                  o8888888o"
#Write-Host -ForegroundColor DarkYellow "                                                  88`" . `"88"
#Write-Host -ForegroundColor DarkYellow "                                                  (| -_- |)"
#Write-Host -ForegroundColor DarkYellow "                                                  0\  =  /0"
#Write-Host -ForegroundColor DarkYellow "                                                ___/`----'\___"
#Write-Host -ForegroundColor DarkYellow "                                              .' \\|     |// '."
#Write-Host -ForegroundColor DarkYellow "                                             / \\|||  :  |||// \"
#Write-Host -ForegroundColor DarkYellow "                                            / _||||| -:- |||||- \"
#Write-Host -ForegroundColor DarkYellow "                                           |   | \\\  -  /// |   |"
#Write-Host -ForegroundColor DarkYellow "                                           | \_|  ''\---/''  |_/ |"
#Write-Host -ForegroundColor DarkYellow "                                           \  .-\__  '-'  ___/-. /"
#Write-Host -ForegroundColor DarkYellow "                                         ___'. .'  /--.--\  `. .'___"
#Write-Host -ForegroundColor DarkYellow "                                      .`"`" '<  `.___\_<|>_/___.' >' `"`"."
#Write-Host -ForegroundColor DarkYellow "                                     | | :  `- \`.;`\ _ /`;.`/ - ` : | |"
#Write-Host -ForegroundColor DarkYellow "                                     \  \ `_.   \_ __\ /__ _/   .-` /  /"
#Write-Host -ForegroundColor DarkYellow "                                 =====`-.____`.___ \_____/___.-`___.-'====="
#Write-Host -ForegroundColor DarkYellow "                                                   `=---='"



Write-Host -ForegroundColor DarkYellow " $(Get-date -Format u) "
#Write-Output $(Get-Host).Version
#Import-VisualStudioEnvironment -Architecture x64

#Import-Module 'D:\polygon\vcpkg\vcpkg\scripts\posh-vcpkg'
