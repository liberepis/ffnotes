
<#PSScriptInfo

.VERSION 1.0

.GUID 03cf9a56-887d-4754-8fd5-a85c16c60147

.AUTHOR Fabio Fantini

.COMPANYNAME

.COPYRIGHT

.TAGS

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#> 



<# 

.DESCRIPTION 
 Studies about variables in PowerShell 

#> 
Param()

clear

Get-Command -Noun Variable
# Clear-Variable
# Get-Variable
# New-Variable 
# Remove-Variable
# Set-Variable

$a = 10
$a
$a.GetType()

# New-Variable
New-Variable -Name b
$null -eq $b

$b = 11
$b
$b.GetType()

Set-Variable -Name b -Value "pippo"
$b

Get-Variable
Get-Variable -Name a -ValueOnly
Get-ChildItem -Path Variable:
