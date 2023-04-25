#arraylists

[System.Collections.ArrayList]$al=@(1, 2, 3)
[System.Collections.ArrayList]$bl=(4, 5, 6)
$al
$bl
$al.Add(4)
$al.Add((5,6,7)) # $al[4] contiene un vettore
$al
$al.RemoveAt(6)
$al[6]
$al[5]
$al[0]
$al[2]
$al[3]
$al[5]
$al.count
$al[5]
$al[2]
$al[3]

foreach ($i in (0..6)) { $al[$i] }
$al[6]

$numbers = New-Object -TypeName System.Collections.ArrayList
foreach ($i in (0..6)) { $numbers.Add($i) }
$numbers

