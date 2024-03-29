﻿import-module au

function global:au_GetLatest {
    $package = [AUPackage]::new( $pwd )
    $url = "https://corp.twingate.com/api/versions/windows"
    $update_data = Invoke-RestMethod -Uri $url -Body @{app_version = $package.NuspecVersion}
    $url     = $update_data.data.downloadable_url
    $version = $($env:ChocolateyPackageVersion)
    if ( (200 -eq $update_data.status) -and ($true -eq $update_data.data.auto_update) -and ("none" -ne $update_data.data.update_Action) ) {
        $url     = $url -replace '.exe$', '.msi'
        $version = $url -split '/' | Select-Object -Last 1 -Skip 1
        return @{ Version = $version; URL64 = $url }
    }
    return @{ Version = $package.NuspecVersion }
}

function global:au_SearchReplace {
    @{}
}

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge
}

update -ChecksumFor none