##############################################################
###          user list based on computer name              ###
##############################################################

<#
Assumptions:  computers are named like the user, for example, I work in IT and my name is bilbo baggins. 

samaccountname is probably something like bbaggins@theshire.net
hostname is something like IT-bbaggins.theshire.net

90% of orgs are structured in this way OR

TSN-SERIAL

#>
# get a list versus an ou - use above for an OU

$comps = @(
"compname",
"compnam2"
)


$extractedValues = $comps | ForEach-Object {
    if ($_ -match "-(.+?)-") { $matches[1] }
}
$comps = $value

foreach ($value in $extractedValues) {
    $user = Get-ADUser -properties * -Filter { SamAccountName -eq $value }  | select-object name, samaccountname, emailAddress
    $user
}