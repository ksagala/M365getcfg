# Connect to SharePoint Online
Connect-SPOService -Url "https://yourdomain-admin.sharepoint.com"

# Export SharePoint Online settings
Export-SPOSite -Identity "https://yourdomain.sharepoint.com/sites/your-site" -Path "C:\Scripts\M365Settings\SPOSettings.xml"

# Export site list with settings
Get-SPOSite | Export-Csv -Path "C:\Scripts\M365Settings\SiteList.csv" -NoTypeInformation

# Export security and sharing settings for SPO sites
Get-SPOSite | ForEach-Object {
    $siteUrl = $_.Url
    $siteId = $_.Id

    # Export security settings
    Get-SPOSiteGroup -Site $siteUrl | Export-Csv -Path "C:\Scripts\M365Settings\SecuritySettings_$siteId.csv" -NoTypeInformation

    # Export sharing settings
    Get-SPOSiteSharingCapability -Site $siteUrl | Export-Csv -Path "C:\Scripts\M365Settings\SharingSettings_$siteId.csv" -NoTypeInformation
}

# Export security and sharing settings for OneDrive for Business sites
Get-SPOSite -Template "OneDrive#0" | ForEach-Object {
    $siteUrl = $_.Url
    $siteId = $_.Id

    # Export security settings
    Get-SPOSiteGroup -Site $siteUrl | Export-Csv -Path "C:\Scripts\M365Settings\SecuritySettings_$siteId.csv" -NoTypeInformation

    # Export sharing settings
    Get-SPOSiteSharingCapability -Site $siteUrl | Export-Csv -Path "C:\Scripts\M365Settings\SharingSettings_$siteId.csv" -NoTypeInformation
}