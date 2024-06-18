[CmdletBinding()]
Param (
  [string]$Identity = 'Abbi'
)

Get-ADReplicationAttributeMetadata -Object (Get-ADUser -Identity $Identity) -Server tor-dc1 |
  Select-Object -Property @{n='Identity';e={$Identity}},
                          @{n='Name';e={$_.AttributeName}}, 
                          @{n='OrigDC';e={$_.LastOriginatingChangeDirectoryServerInvocationId }},
                          @{n='OrigTime';e={$_.LastOriginatingChangeTime }},
                          @{n='OrigUSN';e={$_.LastOriginatingChangeUSN }},
                          @{n='LocalServer';e={$_.Server }},
                          @{n='LocalUSN';e={$_.LocalChangeUsn}},
                          Version |
Format-Table

Get-ADReplicationAttributeMetadata -Object (Get-ADUser -Identity $Identity) -Server lon-dc1 |
  Select-Object -Property @{n='Identity';e={$Identity}},
                          @{n='Name';e={$_.AttributeName}}, 
                          @{n='OrigDC';e={$_.LastOriginatingChangeDirectoryServerInvocationId }},
                          @{n='OrigTime';e={$_.LastOriginatingChangeTime }},
                          @{n='OrigUSN';e={$_.LastOriginatingChangeUSN }},
                          @{n='LocalServer';e={$_.Server }},
                          @{n='LocalUSN';e={$_.LocalChangeUsn}},
                          Version |
Format-Table