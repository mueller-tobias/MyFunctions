﻿<#
This is an example configuration file

By default, it is enough to have a single one of them,
however if you have enough configuration settings to justify having multiple copies of it,
feel totally free to split them into multiple files.
#>

<#
# Example Configuration
Set-PSFConfig -Module 'bConnect' -Name 'Example.Setting' -Value 10 -Initialize -Validation 'integer' -Handler { } -Description "Example configuration setting. Your module can then use the setting using 'Get-PSFConfigValue'"
#>

#Path to an Configuration JSON File
$ConfigurationFile = "$($(Get-PSFConfig -Module 'Schriesheim-IT' -Name 'ConfigurationRepository').Value)\MyFunctions\MyFunctions.json"

Set-PSFConfig -Module 'MyFunctions' -Name 'DHCP.FQDN' -Value '' -Initialize -Validation 'String' -Handler { } -Description "DHCP Server der per Get-DHCPRecentLease abgefragt wird." -ModuleExport

If ($ConfigurationFile)
{
    Import-PSFConfig -Path $ConfigurationFile
}
