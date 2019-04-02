function Install-MMAgent {
    [CmdletBinding()]
    param (
        [string]$WorkspaceKey,
        [string]$WorkspaceID,
        [pscredential]$Credential,
        [string[]]$ComputerName
    )

    foreach ($computer in $ComputerName) {
        Invoke-Command -ComputerName $computer -Credential $Credential -ScriptBlock {
            If (-not (Test-Path "C:\AutomationEasy\MMAgent")) {
                New-Item -Path "C:\AutomationEasy\MMAgent" -ItemType Directory | Out-Null
            }

            If (-not (Test-Path "C:\AutomationEasy\MMAgent\MMASetup-AMD64.exe")) {
                $location = (Invoke-WebRequest "https://go.microsoft.com/fwlink/?LinkId=828603" -MaximumRedirection 0 -ErrorAction SilentlyContinue -UseBasicParsing).Headers.Location
                Start-BitsTransfer -Source $location -Destination "C:\AutomationEasy\MMAgent\MMASetup-AMD64.exe"
            }

            If (-not (Test-Path "C:\AutomationEasy\MMAgent\Setup.exe")) {

                Start-Process -FilePath "C:\AutomationEasy\MMAgent\MMASetup-AMD64.exe" -ArgumentList "/c /t:c:\AutomationEasy\MMAgent\"

                while (-not (Test-Path "C:\AutomationEasy\MMAgent\Setup.exe")) {
                    Start-Sleep 1
                }
            }
            & C:\AutomationEasy\MMAgent\Setup.exe /qn NOAPM=1 ADD_OPINSIGHTS_WORKSPACE=1 OPINSIGHTS_WORKSPACE_AZURE_CLOUD_TYPE=0 OPINSIGHTS_WORKSPACE_ID=$Using:WorkspaceID OPINSIGHTS_WORKSPACE_KEY=$Using:WorkspaceKey AcceptEndUserLicenseAgreement=1
        }
    }
}
