#arraylists

[System.Collections.ArrayList]$al=@(1, 2, 3)
[System.Collections.ArrayList]$bl=(4, 5, 6)
$al
$bl
$al.add(4)
$al.Add((5,6,7))
$al
$al.RemoveAt(6,1)
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


