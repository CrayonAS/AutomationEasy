Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Write-Host "Available repos:`n" 
Get-PSRepository

Install-Module -Scope CurrentUser -Name PowerShellGet -AllowClobber -Force -Repository PSGallery
Import-Module PowerShellGet
Set-PSRepository PSGallery -InstallationPolicy Trusted

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
