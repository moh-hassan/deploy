. .\scripts\run.ps1
Get-Environment

if ($env:SIGNPATH_SIGNING_REQUESt_ID -eq 'NULL')
{
    Write-Host "SIGNPATH_SIGNING_REQUESt_ID is not set"
    exit 1
}

if ($env:ARTIFACTS_PATH -eq 'NULL')
{
    Write-Host "ARTIFACTS_PATH is not set"
    exit 1
}

#- ps: Write-Host "SIGNPATH_SIGNING_REQUEST_ID= $Env:SIGNPATH_SIGNING_REQUEST_ID"  -ForegroundColor Yellow
#- ps: Write-Host "ARTIFACTS_PATH= $Env:ARTIFACTS_PATH"    -ForegroundColor Yellow
Write-Host "Start Loading signed artifacts for SIGNPATH_SIGNING_REQUEST_ID=$env:SIGNPATH_SIGNING_REQUEST_ID"
Download-Artifacts
# - ps: Write-Host "Pushing to MyGet" -ForegroundColor Yellow
# - ps: nuget push $env:ARTIFACTS_PATH  $env:MYGET_KEY -Source https://www.myget.org/F/appvey/api/v2/package
