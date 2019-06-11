Write-Host "Running PS version: $($PSVersionTable.PSVersion)`nOn host: $($env:computername)"

Install-PackageProvider -Name NuGet -Force -MinimumVersion 2.8.5.201

Get-Module -ListAvailable PackageManagement, PowerShellGet

#Unregister-PSRepository -Name 'PSGallery'
Register-PSRepository -Default -InstallationPolicy Trusted
Get-PSRepository

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
