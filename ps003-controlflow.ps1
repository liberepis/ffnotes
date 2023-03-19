<# 

.DESCRIPTION 
 Exercises about Control Flow
#>

<#
   TypeName: System.IO.FileInfo

Name                      MemberType     Definition
----                      ----------     ----------
Target                    AliasProperty  Target = LinkTarget
LinkType                  CodeProperty   System.String LinkType{get=GetLinkType;}
Mode                      CodeProperty   System.String Mode{get=Mode;}
ModeWithoutHardLink       CodeProperty   System.String ModeWithoutHardLink{get=ModeWithoutHardLink;}
ResolvedTarget            CodeProperty   System.String ResolvedTarget{get=ResolvedTarget;}
AppendText                Method         System.IO.StreamWriter AppendText()
CopyTo                    Method         System.IO.FileInfo CopyTo(string destFileName), System.IO.FileInfo CopyTo(string destFileName, bool overwrite)
Create                    Method         System.IO.FileStream Create()
CreateAsSymbolicLink      Method         void CreateAsSymbolicLink(string pathToTarget)
CreateText                Method         System.IO.StreamWriter CreateText()
Decrypt                   Method         void Decrypt()
Delete                    Method         void Delete()
Encrypt                   Method         void Encrypt()
Equals                    Method         bool Equals(System.Object obj)
GetHashCode               Method         int GetHashCode()
GetLifetimeService        Method         System.Object GetLifetimeService()
GetObjectData             Method         void GetObjectData(System.Runtime.Serialization.SerializationInfo info, System.Runtime.Serialization.StreamingContext …
GetType                   Method         type GetType()
InitializeLifetimeService Method         System.Object InitializeLifetimeService()
MoveTo                    Method         void MoveTo(string destFileName), void MoveTo(string destFileName, bool overwrite)
Open                      Method         System.IO.FileStream Open(System.IO.FileStreamOptions options), System.IO.FileStream Open(System.IO.FileMode mode), Sy…
OpenRead                  Method         System.IO.FileStream OpenRead()
OpenText                  Method         System.IO.StreamReader OpenText()
OpenWrite                 Method         System.IO.FileStream OpenWrite()
Refresh                   Method         void Refresh()
Replace                   Method         System.IO.FileInfo Replace(string destinationFileName, string destinationBackupFileName), System.IO.FileInfo Replace(s…
ResolveLinkTarget         Method         System.IO.FileSystemInfo ResolveLinkTarget(bool returnFinalTarget)
ToString                  Method         string ToString()
PSChildName               NoteProperty   string PSChildName=LICENSE
PSDrive                   NoteProperty   PSDriveInfo PSDrive=/
PSIsContainer             NoteProperty   bool PSIsContainer=False
PSParentPath              NoteProperty   string PSParentPath=Microsoft.PowerShell.Core\FileSystem::/home/ulisse/Documenti/repos/ffnotes
PSPath                    NoteProperty   string PSPath=Microsoft.PowerShell.Core\FileSystem::/home/ulisse/Documenti/repos/ffnotes/LICENSE
PSProvider                NoteProperty   ProviderInfo PSProvider=Microsoft.PowerShell.Core\FileSystem
UnixStat                  NoteProperty   Platform+Unix+CommonStat UnixStat=System.Management.Automation.Platform+Unix+CommonStat
Attributes                Property       System.IO.FileAttributes Attributes {get;set;}
CreationTime              Property       datetime CreationTime {get;set;}
CreationTimeUtc           Property       datetime CreationTimeUtc {get;set;}
Directory                 Property       System.IO.DirectoryInfo Directory {get;}
DirectoryName             Property       string DirectoryName {get;}
Exists                    Property       bool Exists {get;}
Extension                 Property       string Extension {get;}
FullName                  Property       string FullName {get;}
IsReadOnly                Property       bool IsReadOnly {get;set;}
LastAccessTime            Property       datetime LastAccessTime {get;set;}
LastAccessTimeUtc         Property       datetime LastAccessTimeUtc {get;set;}
LastWriteTime             Property       datetime LastWriteTime {get;set;}
LastWriteTimeUtc          Property       datetime LastWriteTimeUtc {get;set;}
Length                    Property       long Length {get;}
LinkTarget                Property       string LinkTarget {get;}
Name                      Property       string Name {get;}
UnixFileMode              Property       System.IO.UnixFileMode UnixFileMode {get;set;}
BaseName                  ScriptProperty System.Object BaseName {get=if ($this.Extension.Length -gt 0){$this.Name.Remove($this.Name.Length - $this.Extension.Le…
Group                     ScriptProperty System.Object Group {get= if ($this.UnixStat) { $this.UnixStat.GetGroupName() } ;}
Size                      ScriptProperty System.Object Size {get=$this.UnixStat.Size;}
UnixMode                  ScriptProperty System.Object UnixMode {get=if ($this.UnixStat) { $this.UnixStat.GetModeString() };}
User                      ScriptProperty System.Object User {get= if ($this.UnixStat) { $this.UnixStat.GetUserName() } ;}
VersionInfo               ScriptProperty System.Object VersionInfo {get=[System.Diagnostics.FileVersionInfo]::GetVersionInfo($this.FullName);}

#>

Set-StrictMode -Version 3

function list {
    param (
        $Path
    )
    Get-ChildItem -Path $path -Name -File
}

function space {
    param (
        $Path
    )
    $sum = 0
    Get-ChildItem -Path $Path -File | ForEach-Object -Process {$sum += $PSItem.Size}
    return $sum
}

function newest{
    param (
        $Path
    )
    $files = Get-ChildItem -Path $Path
    $result = $null
    if ($files.count -gt 0){
        $found = $files[0]
        foreach ($file in $files){
            if ($file.LastWriteTime -gt $found.LastWriteTime){
                $found = $file
            }
        }
        $result = $found
    }
    return $result
}

function oldest {
    param (
        $Path
    )
    $files = Get-ChildItem -Path $Path
    $result = $null
    if ($files.count -gt 0){
        $found = $files[0]
        $files.foreach{$found = ($PSItem.LastWriteTime -lt $found.LastWriteTime) ? $PSItem : $found }
        $result = $found
    }
    return $result
}

function largest {
    param (
        $Path
    )
    $files = Get-ChildItem -Path $Path
    $result = $null
    if ($files.Count -gt 0){
        $found = $files[0]
        for ($i = 1; $i -le $files.count; $i++){
            if ($files.Size -gt $found.Size){
                $found = $files[$i]
            }
        }
        $result = $found
    }
    return $result
}

$found = $false
while (-not $found){
    $Path = Read-Host -Prompt "Provide a folder path: "
    $found = Test-Path -Path $Path
    if (-not $found){
        Write-Error -Message "Path not found"
    }
}

$finished = $false
do {
    $option = Read-Host -Prompt "What do you want to do? (list, space, newest, oldest, largest, end)"

    switch ($option){
        "list" {
            Write-Host "List files"
            list -Path $Path
            break
        }
        "space" {
            Write-Host "Space taken by files (in bytes): " -NoNewline
            space -Path $Path
            break
        }
        "newest" {
            Write-Host "The newest file"
            newest -Path $Path
            break
        }
        "oldest" {
            Write-Host "The oldest file"
            oldest -Path $Path
            break
        }
        "largest"{
            Write-Host "The largest file"
            largest -path $Path
            break
        }
        "end" {
            $finished = $true
            break
        }
        default { Write-Error -Message "Unknown command" }
    }
} until ($finished)

