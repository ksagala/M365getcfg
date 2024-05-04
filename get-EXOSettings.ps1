# Connect to Exchange Online
$credential = Get-Credential
$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
Import-PSSession $session -DisableNameChecking

# Export organization settings
Get-OrganizationConfig | Export-Clixml -Path "C:\Scripts\M365Settings\OrganizationSettings.xml"

# Export transport connectors settings
Get-TransportConfig | Export-Clixml -Path "C:\Scripts\M365Settings\TransportConnectors.xml"

# Export security policies
Get-HostedContentFilterPolicy | Export-Clixml -Path "C:\Scripts\M365Settings\SecurityPolicies.xml"

# Export unified labels
Get-Label | Export-Clixml -Path "C:\Scripts\M365Settings\UnifiedLabels.xml"

# Disconnect from Exchange Online
Remove-PSSession $session
# Export send and receive connectors settings
Get-EXOMailboxTransportService | Export-Clixml -Path "C:\Scripts\M365Settings\Connectors.xml"

# Export security policies
Get-EXOAntiSpamPolicy | Export-Clixml -Path "C:\Scripts\M365Settings\SecurityPolicies.xml"

# Export unified labels
Get-EXORetentionLabel | Export-Clixml -Path "C:\Scripts\M365Settings\UnifiedLabels.xml"

# Disconnect from Exchange Online
Disconnect-ExchangeOnline