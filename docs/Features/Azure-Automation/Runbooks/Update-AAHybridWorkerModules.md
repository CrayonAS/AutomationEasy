# Runbook: Update-AAHybridWorkerModules  

NAME:       Update-AAHybridWorkerModules  
AUTHOR:     Morten Lerudjordet  
EMAIL:      morten.lerudjordet@rewired.no  

DESCRIPTION:
            This Runbook will check installed modules in AA account and attempt to download them from the configured trusted repositories on to the hybrid worker(s)
            It can also update modules installed by local configured repositories(using Install-Module) to the newest version available.
            The logic will not clean out older versions of modules.
            The different behaviors are configurable by manipulating parameters of the Runbook, see the parameter description below for further details.


    Note:
            All manually uploaded (not available through repositories configurable through Register-PSRepository) modules to AA will not be handled by this Runbooks, and should be handled by other means
            Run Get-InstalledModule in PS command window (not in ISE) to check that Repository variable is set to a configured and trusted repository

PREREQUISITES:  

* Powershell version 5.1 on hybrid workers
* Latest AzureRM & AzureRM.Automation module installed on hybrid workers for first time run usingInstall-Module from admin PS command line
* Make sure AzureRM.Profile has repository equal to PSGallery (use Get-InstalledModule) to check, if not use Uninstall-Module and Install-Module

Azure Automation Assets:  

     AAhybridWorkerAdminCredentials     = Credential object that contains username & password for an account that is local admin on the hybrid worker(s).
                                          If hybrid worker group contains more than one worker, the account must be allowed to do remoting to all workers.

.PARAMETER UpdateAllHybridGoups  
            If $true the Runbook will try to remote to all hybrid workers in every hybrid group attached to AA account.  
            $false will only update the hybrid workers in the same hybrid group the update Runbook is running on.  
            Default is $false

.PARAMETER ForceReinstallofModule  
            If $true the Runbook will try to force a uninstall-module and install-module if update-module fails.  
            $false will not try to force reinstall of module.  
            Default is $false

.PARAMETER UpdateToNewestModule  
            If $true the Runbook will install newest available module version if the version installed in Azure Automation is not available in repository.  
            $false will not install the module at all on the hybrid worker if the same version as in AA is not available in repository.  
            Default is $false

.PARAMETER SyncOnly  
            If $true the Runbook will only install the modules and version found in Azure Automation.  
            $false will keep all modules on hybrid worker up to date with the latest found in the repository.  
            Default is $false

.PARAMETER UpdateOnly  
            If $true the Runbook will only update already installed modules on the hybrid worker.  
            $false will query AA for modules installed there and add the onces missing on the worker.  
            Default is $false

.PARAMETER AllRepositories  
            If $true the Runbook will use all registered trusted repositories.  
            $false will only use the repository set in ModuleRepositoryName variable.  
            Default is $false

.PARAMETER ModuleRepositoryName  
            Name of repository to use.  
            Default is PSGallery

.PARAMETER ModuleSourceLocation  
            URL of repository location. Set this parameter with the ModuleRepositoryName = the new repo to add.  
            Running the Runbook once will add the new repository to hybrid workers and sets it as trusted.  
            Then set AllRepositories = $true to make the Runbook search all repositories for adding modules from AA or updating them locally.

**Warning:  
    The runbook will automatically set PSGallery as a trusted repository on all workers on first run.  
    It is strongly recommended to set up a private repository to use for production.**