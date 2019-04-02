# Prerequisites

In order to leverage the Active Directory Health Checks feature, the following prerequisites needs to be in place:

- An Azure subscription
- TCP port 443 open outbound from domain controllers to Azure
- Optionally, but highly recommended:
  - Source control for storing scripts and artifacts in this solution  *(examples: Azure DevOps, GitHub, GitLab)*

The following resources can be deployed using the templates and scripts provided:

- Log Analytics workspace (Log Analytics is now a part of Azure Monitor)
- Microsoft Monitoring installation on domain controllers

Alternatively if SCOM is present in the onprem infrastructure, and agents already deployed on domain controllers, you can connect SCOM to the L.A workspace.