<#
.SYNOPSIS
Notes on object creation and manipulating

.DESCRIPTION
In this file we talk about object creation and manipulating
#>
Set-StrictMode -Version 3.0
$ErrorActionPreference = Stop

# Create a pscustomobject for a contact and then add properties. This is not a class, but a single instance in memory
$firstcontact = New-Object -TypeName pscustomobject
Add-Member -InputObject $firstcontact -MemberType NoteProperty -Name Cognome -Value ""
Add-Member -InputObject $firstcontact -MemberType NoteProperty -Name Nome -Value ""
Add-Member -InputObject $firstcontact -MemberType NoteProperty -Name Phone -Value ""

Write-Host "Created a pscustomobject"
$firstcontact | Get-Member

# Write values in properties


# Create an arraylist of contacts