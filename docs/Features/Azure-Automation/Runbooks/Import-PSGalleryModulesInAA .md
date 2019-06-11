# Runbook: Import-PSGalleryModulesInAA
    AUTHOR:         Automation Team
    CONTRIBUTOR:    Morten Lerudjordet
    LASTEDIT:       09.06.2019

SYNOPSIS:  
    This Azure Automation Runbook imports a module and all of it's dependencies into AA from PowerShell Gallery.
    This is meant to only run from an Automation account. This module can import the Az module into the Automation account.

DESCRIPTION:  
    This Azure Automation Runbook imports a module named as parameter input to AA from PowerShell Gallery.

    NOTE:
        AA only supports having one version of the same module imported, therefor this Runbook will only keep the latest version active.
        Even if module dependencies have reliance on previous versions of a module.
        (lik for Az, where different dependencies modules can depend on different versions of Az.Accounts)

        This module can not be run locally without the use of Automation ISE-addon
        URL: https://github.com/azureautomation/azure-automation-ise-addon

PARAMETER NewModuleNames  
    The name of a modules in the PowerShell gallery to import into Automation account.
    If entering multiple values through the portal use the following format:
        ['ModuleNam1','ModuleNam2','ModuleNam3']

PARAMETER ResourceGroupName  
    Optional. The name of the Azure Resource Group containing the Automation account to update all modules for.
    If a resource group is not specified, then it will use the current one for the automation account
    if it is run from the automation service

PARAMETER AutomationAccountName  
    Optional. The name of the Automation account to update all modules for.
    If an automation account is not specified, then it will use the current one for the automation account
    if it is run from the automation service

PARAMETER Force  
    Optional. Forces import of newest version in PS Gallery

PARAMETER DebugLocal  
    Optional. Set to $true if debugging script locally to switch of logic that tries to discover the Automation account it is running in
    Default is $false

EXAMPLE  
    Import-PSGalleryModulesInAA -ResourceGroupName "MyResourceGroup" -AutomationAccountName "MyAutomationAccount" -NewModuleName "AzureRM"
    Import-PSGalleryModulesInAA -NewModuleName "AzureRM"
