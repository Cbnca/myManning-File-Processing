Get-Process | Where-Object {$_.Name -eq "msedge"} | Stop-Process  -WhatIf

"C#, PowerShell, VBScript, Python, and C++" -match "PowerShell"


$Matches[0]

"ABCDEF" -match "\w{3}"
# enough ammo to find the SKU within a file name
"10.0.0.12 - PC1" -match "([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})"
"10.0.0.12 - PC1" -match "([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.(?<last>[0-9]{1,3})"
#"( [0-9] {1,3} )    \.    ( [0-9] {1,3} )    \.    ( [0-9] {1,3} )    \.    ( ?<last> [0-9] {1,3} )"
$Matches.last

function Get-HelloWorld{"Hello World"}
Get-HelloWorld

function Get-Greeting {
    param (
        [string]$USerName
        )
    "Hello World to " + $USerName
}

Get-Greeting "You"



function Add-Integers {
    param (
        [Int32]$firstInteger,
        [Int32]$secondInteger
        )
    $firstInteger + $secondInteger
}

$Result = Add-Integers 2 3
Write-Host " [Result] $($Result)"
