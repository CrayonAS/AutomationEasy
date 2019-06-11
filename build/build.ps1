Register-PSRepository -Default
Get-PSRepository
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
