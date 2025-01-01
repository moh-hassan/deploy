Function Download-Artifacts {
    $CI_USER_TOKEN = $env:SIGNPATH_CI_USER_TOKEN
    $SIGNING_REQUEST_ID = $env:SIGNPATH_SIGNING_REQUESt_ID
    $ORGANIZATION_ID = $env:SIGNPATH_ORGANIZATION_ID
	$output_file= $env:ARTIFACTS_PATH
    #Write-Host "SIGNING_REQUEST_ID: $SIGNING_REQUEST_ID" -ForegroundColor Yellow
    #Write-Host "ORGANIZATION_ID: $ORGANIZATION_ID" -ForegroundColor Yellow

    #Write-Host "output_file: $output_file" -ForegroundColor Yellow

 
    $headers = @{
        "Authorization" = "Bearer $($CI_USER_TOKEN)"
    }

    $ProgressPreference = 'SilentlyContinue'   
    Write-Host "Start downloading artifacts to file: $output_file" -ForegroundColor Yellow

    Invoke-RestMethod -Uri "https://app.signpath.io/API/v1/$ORGANIZATION_ID/SigningRequests/$SIGNING_REQUEST_ID/SignedArtifact" `
        -Headers $headers `
        -OutFile $output_file
    #test if the file exists
    if (-not (Test-Path $output_file)) {
        Write-Host "Failed to download artifacts" -ForegroundColor Red
        exit 1
    }    
    Write-Host "Dwnloading complete to file: $output_file" -ForegroundColor  Cyan
}

Function Get-Environment
{
    $folder = $PSScriptRoot
    $fileName = "$folder\env.txt"

  #param ([string] $fileName = "envirinment.txt")
 $envs = Get-Content -Path $fileName | ConvertFrom-StringData
 $env:SIGNPATH_SIGNING_REQUESt_ID = $envs.SIGNPATH_SIGNING_REQUESt_ID  
 $env:ARTIFACTS_PATH = $envs.ARTIFACTS_PATH

#  $envs
write-host "ARTIFACTS_PATH: $env:ARTIFACTS_PATH" -ForegroundColor Yellow
Write-Host "SIGNPATH_SIGNING_REQUESt_ID: $env:SIGNPATH_SIGNING_REQUESt_ID" -ForegroundColor Yellow

}