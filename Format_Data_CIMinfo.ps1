# all the CIM classes names.
Get-CIMClass

# a CIM class filtered on name.
Get-CIMClass -ClassName *BIOS*

# get the properties of a CIM class
(Get-CIMClass -ClassName Win32_BIOS).CimClassProperties

# get the names of the properties of a CIM class
(Get-CIMClass -ClassName Win32_BIOS).CimClassProperties | Select-Object Name | Sort-Object Name

##
 # now get an INSTANCE of the class named Win32_BIOS  :-)
##
Get-CimInstance -ClassName Win32_BIOS    # prints to screen x4 key value pairs.


<#
BIOS version                            Win32_Bios
Serial Number                           Win32_Bios

PC Model and Manufacturer               Win32_ComputerSystem

Free space for all the physical drives  Win32_LogicalDisk
Operating System                        Win32_LogicalDisk

Default Printer                         Win32_Printer    boolean	Default

#>



$BiosClass = Get-CimInstance -ClassName Win32_BIOS
$BiosClass.SMBIOSBIOSVersion
$BiosClass.SerialNumber

$ComputerSystemClass = Get-CimInstance -ClassName Win32_ComputerSystem
$ComputerSystemClass.Model
$ComputerSystemClass.Manufacturer

$LogicalDisk = Get-CimInstance -ClassName Win32_LogicalDisk
$LogicalDisk.Length
for ($i=0; $i -le $LogicalDisk.Length; $i++){
    $i
    $LogicalDisk[$i].FreeSpace
}
$LogicalDisk[0].FreeSpace

$OperatingSystem = Get-CimInstance -ClassName Win32_OperatingSystem
$OperatingSystem.Caption

$Printer = Get-CimInstance -ClassName Win32_Printer
$Printer.Length
for ($i=0; $i -le $Printer.Length; $i++){
    $i
    $Printer[$i].Name
    $Printer[$i].Default
}

