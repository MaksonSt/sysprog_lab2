# Item 3: energy consumption.
#
# WSL has no RAPL energy counter, but Windows exposes the same AMD RAPL
# counter through the "Energy Meter" performance counter set:
#   rapl_package0_pkg - whole CPU package (= perf power/energy-pkg/)
#
# Method:
#   1) idle baseline: average CPU power while nothing runs
#   2) run the program in WSL, measure CPU energy over the run
#   3.1 system energy  = energy counter delta during the run
#   3.2 program energy = system energy - idle power * run time
#
# Run from PowerShell in the project folder:
#   powershell -ExecutionPolicy Bypass -File scripts\03_energy.ps1 -Variants O0,O3 -Repeats 1
#
# Close heavy apps first: background activity in Windows adds noise.

param(
    [string[]]$Variants = @('O0', 'O3'),
    [int]$N = 1024,
    [int]$IdleSeconds = 10,
    [int]$CooldownSeconds = 5,
    [int]$Repeats = 3,
    [string]$Distro = 'Ubuntu-24.04'
)

$ErrorActionPreference = 'Stop'
# "-Variants O0,O3" arrives as one string when run via -File
$Variants = $Variants -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ }

# Repetitions so every variant runs ~12-15 s (enough for a stable reading).
$RepsByVariant = @{ O0 = 3; O3 = 200 }

$root = Split-Path -Parent $PSScriptRoot
$results = Join-Path $root 'results'
New-Item -ItemType Directory -Force $results | Out-Null
$linuxRoot = (wsl.exe -d $Distro wslpath -a ($root -replace '\\', '/')).Trim()

$PWH_TO_J = 3600 / 1e12   # counter unit is picowatt-hours

function Read-Energy {
    [pscustomobject]@{
        Time   = [Diagnostics.Stopwatch]::GetTimestamp()
        Energy = (Get-Counter '\Energy Meter(rapl_package0_pkg)\Energy').CounterSamples.RawValue
    }
}

function Get-Delta($a, $b) {
    [pscustomobject]@{
        Seconds = ($b.Time - $a.Time) / [Diagnostics.Stopwatch]::Frequency
        Joules  = ($b.Energy - $a.Energy) * $PWH_TO_J
    }
}

function Measure-Once($v, $reps) {
    # Short pause so the CPU settles after the previous run.
    Start-Sleep -Seconds $CooldownSeconds

    Write-Host "  idle baseline for $IdleSeconds s..."
    $a = Read-Energy; Start-Sleep -Seconds $IdleSeconds; $b = Read-Energy
    $idle = Get-Delta $a $b
    $idleW = $idle.Joules / $idle.Seconds

    Write-Host "  running build/matmul_$v $N $reps ..."
    $a = Read-Energy
    $out = wsl.exe -d $Distro --cd $linuxRoot -- "build/matmul_$v" $N $reps
    $b = Read-Energy
    $run = Get-Delta $a $b
    Write-Host "  $out"

    $programJ = $run.Joules - $idleW * $run.Seconds
    [pscustomobject]@{
        Variant   = $v
        Reps      = $reps
        Seconds   = [math]::Round($run.Seconds, 2)
        IdleW     = [math]::Round($idleW, 2)
        AvgW      = [math]::Round($run.Joules / $run.Seconds, 2)
        System_J  = [math]::Round($run.Joules, 1)
        Program_J = [math]::Round($programJ, 1)
        J_per_mul = [math]::Round($programJ / $reps, 3)
    }
}

# Make sure the WSL VM is already running, so its start-up is not measured.
wsl.exe -d $Distro -- true

$rows = @()
$trials = @()
foreach ($v in $Variants) {
    $reps = $RepsByVariant[$v]
    Write-Host "=== $v (n=$N, reps=$reps, $Repeats trials) ===" -ForegroundColor Cyan
    $vt = @()
    for ($t = 1; $t -le $Repeats; $t++) {
        Write-Host " trial $t/$Repeats"
        $vt += Measure-Once $v $reps
    }
    $trials += $vt
    # Background activity in Windows adds noise, so keep the median trial.
    $sorted = $vt | Sort-Object Program_J
    $rows += $sorted[[int][math]::Floor(($sorted.Count - 1) / 2)]
}
$trials | Export-Csv (Join-Path $results 'energy_trials.csv') -NoTypeInformation -Encoding utf8

$text = "3.1 System_J = CPU energy during the run;  3.2 Program_J = System_J - IdleW * Seconds`n"
$text += ($rows | Format-Table -AutoSize | Out-String -Width 200)
$base = $rows | Where-Object Variant -eq 'O0' | Select-Object -First 1
if ($base) {
    $text += "Energy for ONE multiplication:`n"
    foreach ($r in $rows) {
        if ($r.Variant -eq 'O0') { $text += ("  O0: {0} J`n" -f $r.J_per_mul); continue }
        $text += ("  {0}: {1} J  ({2}x less than O0)`n" -f $r.Variant, $r.J_per_mul,
            [math]::Round($base.J_per_mul / $r.J_per_mul, 1))
    }
}
Write-Host $text
[IO.File]::WriteAllText((Join-Path $results 'energy_report.txt'), $text, (New-Object Text.UTF8Encoding($false)))
$rows | Export-Csv (Join-Path $results 'energy.csv') -NoTypeInformation -Encoding utf8
Write-Host "Saved: results\energy_report.txt, results\energy.csv"
