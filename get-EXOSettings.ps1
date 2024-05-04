# Connect to Exchange Online
$credential = Get-Credential
Connect-ExchangeOnline -Credential $credential

# Export organization settings
# Get-OrganizationConfig | Export-Clixml -Path "C:\Scripts\M365getcfg\OrganizationSettings.xml"
Get-OrganizationConfig > "OrganizationSettings.txt"

# Export transport connectors settings
# Get-TransportConfig | Export-Clixml -Path "C:\Scripts\M365getcfg\TransportConnectors.xml"
# Get-InboundConnector | Export-Clixml -Path "C:\Scripts\M365getcfg\InboundConnectors.xml"
# Get-OutboundConnector -IncludeTestModeConnectors | Export-Clixml -Path "C:\Scripts\M365getcfg\OutboundConnectors.xml"
Get-TransportConfig > "\TransportConnectors.txt"
Get-InboundConnector > "InboundConnectors.txt"
Get-OutboundConnector > "OutboundConnectors.txt"

# Export security policies
Get-HostedContentFilterPolicy | Export-Clixml -Path "C:\Scripts\M365getcfg\SecurityPolicies.xml"

# Export unified labels
Get-Label | Export-Clixml -Path "C:\Scripts\M365getcfg\UnifiedLabels.xml"

# Export send and receive connectors settings
Get-EXOMailboxTransportService | Export-Clixml -Path "C:\Scripts\M365getcfg\Connectors.xml"

# Export security policies
Get-EXOAntiSpamPolicy | Export-Clixml -Path "C:\Scripts\M365getcfg\SecurityPolicies.xml"

# Export unified labels
Get-EXORetentionLabel | Export-Clixml -Path "C:\Scripts\M365getcfg\UnifiedLabels.xml"

# Disconnect from Exchange Online
Disconnect-ExchangeOnline