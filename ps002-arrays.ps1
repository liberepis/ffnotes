<#
.SYNOPSIS
Arrays in this file there are examples of use of arrays
#>

function printarray {
    param ([System.Object[]]$vett) # param vett must be an array

    $i = 0
    foreach ($e in $vett) {
        Write-Host "$i : $($vett[$i])"
        $i++
    }
}

#basic array definition
$a = 1,2,3
printarray -vett $a
$a.Gettype()
$a.Count

#Array subexpression operator @( )
#https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.3#array-subexpression-operator--
$b = @(1,2,3)
printarray -vett $b
$b.gettype()
$b.Count

#creating an array with only one element
$c=,7
$c.Count
$c[0]
printarray -vett $c

#adding elements to array
$d = $a + 4 #this create an array with one more element
$d

#this add two elements to array $a
$d = $a + 4 + 5
$d

#this create an array with one more element and assign it to the $a variable; it is different from adding an element to an array
$a = $a + 4
$a

#store an array in an element
$a[3] = 10,11,12
printarray -vett $a

#typed arrays
[Int32[]]$ia = 123, 456, 789
$ia
