# SCOM integration to Log Analytics

## Connect SCOM to Log Analytics workspace

Follow [this](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/om-agents#connecting-operations-manager-to-log-analytics) guide.

Select the workspace you created in Azure Log Analytics for this purpose.

## Create a computer group in SCOM containing all domain controllers

Follow [this](https://docs.microsoft.com/en-us/system-center/scom/manage-create-manage-groups?view=sc-om-2019#to-create-a-group-in-operations-manager) guide to create the group.

Hint: Create a dynamic group that contains all domain controllers so that new ones will join automatically.

## Add the computer group to the Managed computers node

After configuring integration with your Log Analytics workspace, it only establishes a connection with the service, no data is collected from the agents reporting to your management group.

Follow [this](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/om-agents#add-agent-managed-computers) guide.

Add the group you created in the previos step.

As an option you can also add single computers for testing purposes.
