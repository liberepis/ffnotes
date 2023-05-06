Set-StrictMode -Version 3.0

Write-Host "This program read some numbers from input and make some statistical calculation"

$quantity = Read-Host -Prompt "How many numbers do you want to input? "

$numbers = New-Object -TypeName System.Collections.ArrayList

for ($i = 0; $i -lt $quantity; $i++){
    $number = Read-Host -Prompt "$i Insert a number: "
    $numbers.Add($number) | Out-Null
}

Write-Host "Statistics"

$sum = 0

foreach ($number in $numbers){
    $sum += $number
}

Write-Host "The sum is $sum"

$mean = $sum/$numbers.Count
Write-Host "The mean is $mean"
