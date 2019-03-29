[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingWriteHost", "", Justification = "By design - used in script intended for interactive use.")]
param(
    $ResourceGroupName = "active-directory-health-rg",
    $WorkspaceName = "active-directory-health-" + (Get-Random -Maximum 99999), # workspace names need to be unique - Get-Random helps with this for the example code
    $Location = "westeurope",
    $Sku = 'standalone'
)
<#

 NAME: New-AzureLogAnalyticsWorkspace.ps1

 AUTHOR: Jan Egil Ring
 EMAIL: jan.egil.ring@crayon.com

 COMMENT: PowerShell script to provisioning a new Log Analytics workspace
          Based on https://docs.microsoft.com/en-us/azure/azure-monitor/platform/powershell-workspace-configuration

 #>


 if (Get-Module -ListAvailable -Name Az.OperationalInsights) {

    Import-Module -Name Az.OperationalInsights

} else {

    Write-Warning "Missing prerequisite Az PowerShell module, exiting..."
    Write-Host "You may install the module from PowerShell Gallery using PowerShellGet: Install-Module -Name Az" -ForegroundColor Yellow

    break

}

#region Authenticate to Azure

Connect-AzAccount

$subscriptionId = (Get-AzSubscription | Out-GridView -Title 'Select an Azure subscription' -PassThru).SubscriptionId

Set-AzContext -SubscriptionId $subscriptionId

#endregion

# Create the resource group if needed
try {

    Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction Stop

} catch {

    New-AzResourceGroup -Name $ResourceGroupName -Location $Location

}

#region Create the workspace

$WorkspaceParameters = @{
    Name = $WorkspaceName
    Location = $Location
    ResourceGroupName = $ResourceGroupName
    Sku = $Sku
}

if ($Sku -eq 'standalone') {
    $WorkspaceParameters.Add('RetentionInDays',90)
}

New-AzOperationalInsightsWorkspace @WorkspaceParameters

#endregion

#region Add solutions

$Solutions = 'ADAssessment','ADReplication','DnsAnalytics'

foreach ($solution in $Solutions) {

    Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $ResourceGroupName -WorkspaceName $WorkspaceName -IntelligencePackName $solution -Enabled $true

}

#endregion