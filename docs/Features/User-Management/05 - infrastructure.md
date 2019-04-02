# Establish infrastructure

## Common resources for both supported scenarios

### Create the required Azure resources

- An Azure Automation account
- A Log Analytics workspace
- Optionally configure a Hybrid Runbook Worker.

Instructions is available in the [Azure Automation solution](/../../Features/Azure-Automation/04%20-%20installation).

### Create the required Office 365 resources

- Sharepoint site for IT Automation (alternatively leverage existing site if desired)
- Sharepoint lists

The [New-SharepointAutomationSite.ps1](https://github.com/CrayonAS/AutomationEasy/blob/master/deploy/user-management/Office%20365/Sharepoint%20Online/New-SharepointAutomationSite.ps1) and [Apply-SharepointAutomationListTemplate.ps1](https://github.com/CrayonAS/AutomationEasy/blob/master/deploy/user-management/Office%20365/Sharepoint%20Online/Apply-SharepointAutomationListTemplate.ps1) scripts can be used to automate the creation of a dedicated Sharepoint site for IT Automation as well as import Sharepoint list templates provided by Automation Easy.

## Scenario 1 - User on- and offboarding requests via a frontend

1. Create the required Azure resources:

- Azure Logic Apps
  - User Onboarding
  - User Offboarding

*Templates for the Logic Apps which can be used as starting points will be available soon in Automation Easy.*
<!-- markdownlint-disable MD029 -->

2. Create the required Office 365 resources:

<!-- markdownlint-enable MD029 -->

- PowerApps
  - User Onboarding
  - User Offboarding

*Templates for the PowerApps which can be used as starting points will be available soon in Automation Easy.*

## Scenario 2 - Synchronizing users between an HR database and Active Directory

### Establish the required configuration settings

Automation Easy provides 2 options for defining the settings:

1. JSON-file - a template file is provided
2. Sharepoint list - template files is provided