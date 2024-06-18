[cmdletbinding()]
Param (
  $AdminCreds = (Get-Credential -UserName 'Adatum\Administrator' -Message 'Enter the Domain Credential'),
  $Domain = 'adatum.com'
)
# Installing the ADDS Roles and Features
Add-WindowsFeature AD-Domain-Services, RSAT-AD-AdminCenter, RSAT-ADDS-Tools 

# Promoting the Server to become a DC
Install-ADDSDomainController -DomainName $Domain -InstallDNS:$True -Credential $AdminCreds -SafeModeAdministratorPassword $AdminCreds.Password -NoGlobalCatalog -Force 
 