Write-Host "Running PS version: $($PSVersionTable.PSVersion)`nOn host: $($env:computername)"

Get-Module -ListAvailable PackageManagement, PowerShellGet

Unregister-PSRepository -Name 'PSGallery'
Register-PSRepository -Default
Get-PSRepository

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer

Install-PackageProvider -Name NuGet -Force #-MinimumVersion 2.8.5.201 -Verbose
