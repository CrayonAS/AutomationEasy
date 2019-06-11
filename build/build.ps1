Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Register-PSRepository -Name "PSGallery" -SourceLocation "https://www.powershellgallery.com/api/v2/" -PublishLocation "https://www.powershellgallery.com/api/v2/package/" -InstallationPolicy 'Trusted'

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
