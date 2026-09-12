[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$TargetPath,

    [ValidateSet('plus-efficient', 'plus-economy', 'plus-quality')]
    [string]$Profile = 'plus-efficient',

    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$sourceRoot = $PSScriptRoot
$targetRoot = (Resolve-Path -LiteralPath $TargetPath).Path
$profileRoot = Join-Path $sourceRoot "profiles\$Profile\codex"
$skillRoot = Join-Path $sourceRoot 'skills\knowledge-work-orchestrator'

if (-not (Test-Path -LiteralPath $profileRoot -PathType Container)) {
    throw "Profile not found: $Profile"
}

$installMap = @()
$installMap += Get-ChildItem -LiteralPath $profileRoot -Recurse -File | ForEach-Object {
    [pscustomobject]@{
        Source = $_.FullName
        Destination = Join-Path $targetRoot ('.codex\' + $_.FullName.Substring($profileRoot.Length).TrimStart('\'))
    }
}
$installMap += Get-ChildItem -LiteralPath $skillRoot -Recurse -File | ForEach-Object {
    [pscustomobject]@{
        Source = $_.FullName
        Destination = Join-Path $targetRoot ('.agents\skills\knowledge-work-orchestrator\' + $_.FullName.Substring($skillRoot.Length).TrimStart('\'))
    }
}

$conflicts = $installMap | Where-Object {
    if (-not (Test-Path -LiteralPath $_.Destination -PathType Leaf)) { return $false }
    (Get-FileHash -Algorithm SHA256 -LiteralPath $_.Source).Hash -ne
        (Get-FileHash -Algorithm SHA256 -LiteralPath $_.Destination).Hash
}

if ($conflicts -and -not $Force) {
    Write-Host 'Existing files would change:' -ForegroundColor Yellow
    $conflicts | ForEach-Object { Write-Host "  $($_.Destination)" }
    Write-Host 'Re-run with -Force to create timestamped backups and install.' -ForegroundColor Yellow
    exit 2
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
foreach ($item in $installMap) {
    $destinationParent = Split-Path -Parent $item.Destination
    New-Item -ItemType Directory -Force -Path $destinationParent | Out-Null

    if (Test-Path -LiteralPath $item.Destination -PathType Leaf) {
        $sourceHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $item.Source).Hash
        $destinationHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $item.Destination).Hash
        if ($sourceHash -eq $destinationHash) { continue }
        Copy-Item -LiteralPath $item.Destination -Destination "$($item.Destination).backup-$stamp"
    }

    Copy-Item -LiteralPath $item.Source -Destination $item.Destination -Force
}

Write-Host "Installed profile '$Profile' in $targetRoot" -ForegroundColor Green
Write-Host 'Restart Codex in the target project to load project-scoped configuration.'
