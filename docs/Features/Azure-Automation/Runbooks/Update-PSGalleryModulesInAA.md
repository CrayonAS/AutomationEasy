# Runbook: Update-PSGalleryModulesInAA
    AUTHOR:         Automation Team
    CONTRIBUTOR:    Morten Lerudjordet
    LASTEDIT:       09.06.2019

SYNOPSIS:  
        This Azure Automation Runbook imports the latest version of installed modules in Automation Account from PowerShell Gallery.
        It can also only update the Azure modules by setting a parameter. This is meant to only run from an Automation account.
        Use Import-PSGalleryModulesToAA for first time import of Az module (takes a long time to import all submodules).

DESCRIPTION:  
    This Azure Automation Runbook imports the latest version from PowerShell Gallery of all modules in an
    Automation account. By connecting the Runbook to an Automation schedule, you can ensure all modules in
    your Automation account stay up to date. Or only update the Azure modules

    NOTE:
    This module can not be run locally without the use of Automation ISE-addon
    URL: https://github.com/azureautomation/azure-automation-ise-addon

PARAMETER ResourceGroupName  
    Optional. The name of the Azure Resource Group containing the Automation account to update all modules for.
    If a resource group is not specified, then it will use the current one for the automation account
    if it is run from the automation service

PARAMETER AutomationAccountName  
    Optional. The name of the Automation account to update all modules for.
    If an automation account is not specified, then it will use the current one for the automation account
    if it is run from the automation service

PARAMETER UpdateAzureModulesOnly  
    Optional. Set to $false to have logic try to update all modules installed in account.
    Default is $true, and this will only update Azure modules. Both AzureRM and Az if present in Automation account

PARAMETER DebugLocal  
    Optional. Set to $true if debugging script locally to switch of logic that tries to discover the Automation account it is running in
    Default is $false

EXAMPLE:  
    Update-PSGalleryModulesInAA -ResourceGroupName "MyResourceGroup" -AutomationAccountName "MyAutomationAccount"
    Update-PSGalleryModulesInAA -UpdateAzureModulesOnly $false
    Update-PSGalleryModulesInAA
