
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = ''
$url64      = "https://binaries.twingate.com/client/windows/versions/1.0.18.11084/TwingateWindowsInstaller.msi"
$checksum64 = '9E83FE5E8095784E83E7CFCCC1B663E6EA299E443599DD51A3C621FED0A70059'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'

  file           = ''
  file64         = gi $toolsDir\*x64.msi
  softwareName  = 'twingate*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:ChocolateyPackageVersion).MsiInstall.log`" no_optional_updates=true"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs