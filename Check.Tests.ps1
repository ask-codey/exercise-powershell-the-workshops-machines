# Checks the eight results, one test per task in README.md.
# It reads only the files in this folder, so it works in any PowerShell window.
# Run it from this folder with: Invoke-Pester
# You don't need to change this file.

BeforeAll {
    # The non-empty lines of a file in this folder, trimmed, or $null when the file isn't there.
    function Get-ReportLines([string] $name) {
        $path = Join-Path $PSScriptRoot $name
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return $null }
        @(Get-Content -LiteralPath $path | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' })
    }

    # What a file holds, as one line of text for a test's message.
    function Show-Report([string] $name) {
        $lines = Get-ReportLines $name
        if ($null -eq $lines) { return "(no $name)" }
        if ($lines.Count -eq 0) { return "($name is empty)" }
        $lines -join ' | '
    }
}

Describe "Exercise: The Workshop's Machines" {

    It '1) label.txt says how many machines are in machines.txt' {
        Show-Report 'label.txt' | Should -Be 'The workshop has 5 machines' -Because 'task 1 reads machines.txt into $machines with Get-Content (one item a line) and writes one line made with double quotes and $( ): "The workshop has $($machines.Count) machines"'
    }

    It '2) machines-new.txt is the list with the music box added at the end' {
        Show-Report 'machines-new.txt' | Should -Be 'kettle-bot | oil can | clock | gearbox | bell | music box' -Because 'task 2 adds music box to the end of $machines with +=, then writes the whole array into machines-new.txt, one machine a line (Set-Content machines-new.txt $machines)'
    }

    It '3) order.txt is the parts order, dollar signs and all' {
        Show-Report 'order.txt' | Should -Be 'Parts to order: | 2 brass springs at $4.50 each | 1 copper beak at $12.00' -Because 'task 3 writes the three lines with a single-quoted here-string, @'' on the first line and ''@ at the start of the last, so every $ stays. If the prices lost their $4 and $12, the here-string was double-quoted'
    }

    It '4) next-oiling.txt is 30 days after the date in oil-log.txt' {
        Show-Report 'next-oiling.txt' | Should -Be '2026-11-27' -Because 'task 4 turns the text in oil-log.txt into a date with [datetime], adds 30 days with .AddDays(30), and writes it as year-month-day with Get-Date -Format ''yyyy-MM-dd'' (or .ToString(''yyyy-MM-dd''))'
    }

    It '5) days.txt counts the days from the last oiling to December 4, 2026' {
        Show-Report 'days.txt' | Should -Be '37' -Because 'task 5 subtracts the date in oil-log.txt from [datetime]''2026-12-04'' and writes only the TimeSpan''s .Days, a whole number'
    }

    It '6) drawers.txt says how many things the hashtable holds and where the springs are now' {
        Show-Report 'drawers.txt' | Should -Be '4 things; springs in drawer-4' -Because 'task 6 changes springs to drawer-4 and adds a golden cog key in drawer-3 to $drawers, then writes "$($drawers.Count) things; springs in $($drawers.springs)"'
    }

    It '7) tea.txt: the kettle-bot ran with POWER on' {
        Show-Report 'tea.txt' | Should -Be 'Pouring tea...' -Because 'task 7 sets the environment variable with $env:POWER = ''on'' (a plain $POWER is only a PowerShell variable, which the kettle-bot never reads), then runs .\kettle-bot.ps1, which writes tea.txt itself'
    }

    It '8) oiled.txt: the oil can ran by name, from your PATH' {
        Show-Report 'oiled.txt' | Should -Be 'Glug, glug. The gears are oiled and shining.' -Because 'task 8 adds this folder''s tools folder to $env:PATH with += and a ; in front, then types oil gears. The oil can writes oiled.txt only when it is called by its name, not by its path'
    }
}
