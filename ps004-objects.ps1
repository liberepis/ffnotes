<#
.SYNOPSIS
Notes on object creation and manipulating

.DESCRIPTION
In this file we talk about object creation and manipulating
#>

$contact = New-Object -TypeName pscustomobject
Add-Member -InputObject $contact -MemberType NoteProperty -Name Cognome -Value ""
Add-Member -InputObject $contact -MemberType NoteProperty -Name Nome -Value ""

$contact | Get-Member
