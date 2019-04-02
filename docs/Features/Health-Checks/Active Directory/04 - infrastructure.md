# Establish infrastructure

## Create the required Azure resources

- A Log Analytics workspace

The [New-AzureLogAnalyticsWorkspace.ps1](https://github.com/CrayonAS/AutomationEasy/blob/master/deploy/health-checks/active-directory/New-AzureLogAnalyticsWorkspace.ps1) script can be used to automate the creation of a Log Analytics workspace with the necessary Solutions enabled.

## Deploy Microsoft Monitoring Agent to domain controllers