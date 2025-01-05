<# Requires install of

Assumptions:

1. Running in vscode - extentions:

- Azure Cloud Shell installed
- Microsoft Entra External ID

2. Elevated user account (eg security admin role)
3. node.js installed

#>

###################################################################
#####                   DEFINE VARIABLES                      #####
###################################################################

# Group ID of users

$azgid = "azure group ID insert here"

# Authenticate with user account
Connect-MGGraph -Scope "User.Read.All"

# get all devices

$devices = Get-MgDevice

# lo0p through each device and get the user
$results = @()

foreach ($device in $devices) {
    $associatedUser = Get-MgUser -UserId $device.userId
    $results += [PSCustomObject]@{
        DeviceName = $device.displayName
        AssociatedUser = $associatedUser.displayName
    }
}

# Export results to CSV
$results | Export-Csv -Path "C:\path\to\your\output.csv" -NoTypeInformation

# full script

# Install required modules
Install-Module -Name Microsoft.Graph -Force -AllowClobber
Install-Module -Name PowerShellGet -Force -AllowClobber

# Connect to Microsoft Graph
Connect-MgGraph -Credential (Get-Credential)

# Retrieve all devices
$devices = Get-MgDevice

# Initialize results array
$results = @()

# Loop through each device and retrieve associated user
foreach ($device in $devices) {
    $associatedUser = Get-MgUser -UserId $device.userId
    $results += [PSCustomObject]@{
        DeviceName = $device.displayName
        AssociatedUser = $associatedUser.displayName
    }
}

# Export results to CSV
$results | Export-Csv -Path "C:\path\to\your\output.csv" -NoTypeInformation


# Install required modules
Install-Module -Name Microsoft.Graph -Force -AllowClobber
Import-Module Microsoft.Graph

# Connect to Microsoft Graph
Connect-MgGraph -Credential (Get-Credential)

# Define the Azure AD group ID (replace with your group's ID)
$groupId = "$azgid"

# Install required modules
Install-Module -Name Microsoft.Graph -Force -AllowClobber
Import-Module Microsoft.Graph

# Connect to Microsoft Graph
Connect-MgGraph -Credential (Get-Credential)

# Define the Azure AD group ID (replace with your group's ID)
$groupId = "$azgid"
$dev
# Get devices in the Azure AD group
$devices = Get-MgGroupMember -GroupId $groupId -All

# Initialize results array
$results = @()

# Loop through each device and retrieve associated user
foreach ($device in $devices) {
    if ($device.objectType -eq 'Device') {
        $deviceDetails = Get-MgDevice -DeviceId $device.Id
        $associatedUser = Get-MgUser -UserId $deviceDetails.userId
        $results += [PSCustomObject]@{
            DeviceName = $deviceDetails.displayName
            AssociatedUser = $associatedUser.displayName
        }
    }
}

# Export results to CSV
$results | Export-Csv -Path "C:" -NoTypeInformation










