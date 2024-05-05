# Connect to Exchange Online
$credential = Get-Credential
Connect-ExchangeOnline -Credential $credential

# Export organization settings
# Get-OrganizationConfig | Export-Clixml -Path "C:\Scripts\M365getcfg\OrganizationSettings.xml"
Get-OrganizationConfig | Format-List > "OrganizationSettings.txt"

# Export transport connectors settings
# Get-TransportConfig | Export-Clixml -Path "C:\Scripts\M365getcfg\TransportConnectors.xml"
# Get-InboundConnector | Export-Clixml -Path "C:\Scripts\M365getcfg\InboundConnectors.xml"
# Get-OutboundConnector -IncludeTestModeConnectors $true | Export-Clixml -Path "C:\Scripts\M365getcfg\OutboundConnectors.xml"
Get-TransportConfig | Format-List > "TransportConnectors.txt"
Get-InboundConnector | Format-List > "InboundConnectors.txt"
Get-OutboundConnector -IncludeTestModeConnectors $true | Format-List > "OutboundConnectors.txt"

# Export send and receive connectors settings
Get-EXOMailboxTransportService | Export-Clixml -Path "C:\Scripts\M365getcfg\Connectors.xml"

# Export antispam policies
Get-HostedContentFilterPolicy | Format-List > "C:\Scripts\M365getcfg\SpamPolicies.txt"

# Export antiphishing policies
# Get-AntiPhishPolicy | Format-Table Name,IsDefault,Enabled,ImpersonationProtectionState,EnableTargetedUserProtection,EnableMailboxIntelligenceProtection,EnableTargetedDomainsProtection
Get-AntiPhishPolicy | Format-List > "C:\Scripts\M365getcfg\PhishPolicies.txt"

# Export unified labels
Get-Label | Export-Clixml -Path "C:\Scripts\M365getcfg\UnifiedLabels.xml"

# Export unified labels
Get-EXORetentionLabel | Export-Clixml -Path "C:\Scripts\M365getcfg\UnifiedLabels.xml"

# Disconnect from Exchange Online
Disconnect-ExchangeOnline