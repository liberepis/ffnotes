<#
.SYNOPSIS
Notes on object creation and manipulating

.DESCRIPTION
In this file we talk about object creation and manipulating
#>
<<<<<<< HEAD
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
=======

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

class ClassContact {
    [string]$Cognome
    [string]$Nome
    [string]$Telefono
}

$contact = New-Object -TypeName ClassContact

$contact.Cognome = "Mario"
$contact.Nome = "Rossi"
$contact.Telefono = "0612345678"

$contact
>>>>>>> 5b6a3ebdb1434d3df34ae66aa313b478d66687e6
