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
$b -eq $null

$b = 11
$b
$b.GetType()

Set-Variable -Name b -Value "pippo"
$b

Get-Variable -Name a -ValueOnly
