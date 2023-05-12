$server = "NWZRSVIIS91"
$db= "DpStatTest"
$filename = ".\SQLtesting.sql"
Write-Host "SQL Setup script"
Invoke-sqlcmd -ServerInstance $server -Database $db -InputFile $filename -verbose