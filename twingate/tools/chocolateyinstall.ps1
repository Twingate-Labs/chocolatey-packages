$ErrorActionPreference = 'Stop';

Confirm-Win10 19043

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  file64        = gi $toolsDir\*x64.msi
  softwareName  = 'twingate*'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:ChocolateyPackageVersion).MsiInstall.log`" no_optional_updates=true"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs