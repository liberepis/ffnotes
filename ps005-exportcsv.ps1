$ErrorActionPreference = 'Stop'

$rows = Import-Csv -Path ./ps005.csv

foreach($row in $rows){
    try{
        $output = @{
            Path = $row.Folder
            Items = 0
            Error = ''
        }
        $output.Items = (Get-ChildItem -Path $row.Folder).Count
    }
    catch{
        $output.Error = $PSItem.Exception.Message
    }
    finally{
        $o = [pscustomobject]$output
        $o
        Export-Csv -InputObject $o -Path ps005-out.csv -NoTypeInformation -Append
    }
}