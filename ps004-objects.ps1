<#
.SYNOPSIS
Notes on object creation and manipulating

.DESCRIPTION
In this file we talk about object creation and manipulating
#>

# Creating an object for a contact
# this is not a class, is a single instance in memory
$contactOldStyle = New-Object -TypeName pscustomobject
Add-Member -InputObject $contactOldStyle -MemberType NoteProperty -Name Cognome -Value ""
Add-Member -InputObject $contactOldStyle -MemberType NoteProperty -Name Nome -Value ""
Add-Member -InputObject $contactOldStyle -MemberType NoteProperty -Name Phone -Value ""

Write-Host "We have created an object for a contact"
$contactOldStyle | Get-Member | Out-Host

# creating an object for a contact in a new style

$properties = [ordered]@{
    Cognome = "";
    Nome = "";
    Telefono = ""
}
# full name for pscustomobject is System.Management.Automation.PSCustomObject
$contactNewStyle = New-Object -TypeName PSCustomObject -Property $properties

Write-Host "another object for a contact"
$contactNewStyle | Get-Member | Out-Host

$rubrica = New-Object -TypeName System.Collections.ArrayList

$contactNewStyle.Nome = "Mario"
$contactNewStyle.Cognome = "Rossi"
$contactNewStyle.Telefono = "0612345678"

$rubrica.Add($contactNewStyle.PSObject.Copy())

$contactNewStyle.Nome = "Giuseppe"
$contactNewStyle.Cognome = "Verdi"
$contactNewStyle.Telefono = "0212345678"

$rubrica.Add($contactNewStyle.psobject.Copy())

$rubrica
