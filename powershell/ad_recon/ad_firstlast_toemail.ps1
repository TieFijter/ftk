# Read the CSV and store it in a variable

$path = "define your path here"
$names = Import-Csv -Path "$path"

# Loop through each name and perform the Get-ADUser lookup
foreach ($name in $names) {
    $firstName = $name.Firstname
    $lastName = $name.Lastname
    $user = Get-ADUser -Filter { GivenName -eq $firstName -and Surname -eq $lastName } -properties * | select-object emailaddress, userprincipalname
    $user | export-csv -path "$path"
}