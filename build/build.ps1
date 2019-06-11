Write-Host "Running PS version: $($PSVersionTable.PSVersion)`nOn host: $($env:computername)"
Install-PackageProvider -Name NuGet -Force #-MinimumVersion 2.8.5.201 -Verbose

Register-PSRepository -Default -Verbose
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -Verbose
Get-PSRepository

Install-Module PSScriptAnalyzer -Scope CurrentUser
Import-Module PSScriptAnalyzer
