Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PowerShellGet -AllowClobber -Force -Repository PSGallery
Set-PSRepository PSGallery -InstallationPolicy Trusted

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
