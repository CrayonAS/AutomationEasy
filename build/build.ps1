Write-Host "Running PS version: $($PSVersionTable.PSVersion)`nOn host: $($env:computername)"

Install-PackageProvider -Name NuGet -Force -MinimumVersion 2.8.5.201

Get-Module -ListAvailable PackageManagement, PowerShellGet

#Unregister-PSRepository -Name 'PSGallery'
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Get-PSRepository

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
