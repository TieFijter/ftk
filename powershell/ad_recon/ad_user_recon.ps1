# Define the path to your text file
$filePath = "C:\Path\To\YourFile\users.csv"

# Read the content of the text file
$content = Get-Content -Path $filePath

# Split the content into individual names
$names = $content -split ''

# Iterate through each name and process it
foreach ($name in $names) {
    # Extract first and last names
    $fullName = $name -split ' '
    $firstName = $fullName[0]
    $lastName = $fullName[1]

    # Perform the lookup action with the first and last name
    $user = Get-ADUser -Filter { GivenName -eq $firstName -and Surname -eq $lastName } -Properties EmailAddress

    if ($user) {
        Write-Output "Found user: $($user.Name), Email: $($user.EmailAddress)"
    } else {
        Write-Output "User not found: $name"
    }
}