Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Register-PSRepository -Default -InstallationPolicy 'Trusted'

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
