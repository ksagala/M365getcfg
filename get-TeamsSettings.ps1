# Install the Microsoft Teams PowerShell module if not already installed
if (-not (Get-Module -Name MicrosoftTeams -ListAvailable)) {
    Install-Module -Name MicrosoftTeams -Force
}

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Export all Teams settings
$settings = Get-CsTeamsClientConfiguration
$settings | Export-Csv -Path "C:\Scripts\M365Settings\TeamsSettings.csv" -NoTypeInformation

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
# Export Meetings Policies
$meetingsPolicies = Get-CsTeamsMeetingPolicy -All
$meetingsPolicies | Export-Csv -Path "C:\Scripts\M365Settings\MeetingsPolicies.csv" -NoTypeInformation

# Export Messaging Policies
$messagingPolicies = Get-CsTeamsMessagingPolicy -All
$messagingPolicies | Export-Csv -Path "C:\Scripts\M365Settings\MessagingPolicies.csv" -NoTypeInformation

# Export Guest Settings
$guestSettings = Get-CsTeamsGuestSettings
$guestSettings | Export-Csv -Path "C:\Scripts\M365Settings\GuestSettings.csv" -NoTypeInformation

# Export Application Policies
$applicationPolicies = Get-CsTeamsAppPolicy -All
$applicationPolicies | Export-Csv -Path "C:\Scripts\M365Settings\ApplicationPolicies.csv" -NoTypeInformation

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams