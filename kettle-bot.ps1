# KETTLE-BOT 3000, by Ada Wren.
# Reads the environment variable POWER. When POWER is on, it pours tea and writes tea.txt beside itself.
if ($env:POWER -eq 'on') {
    Set-Content -Path (Join-Path $PSScriptRoot 'tea.txt') -Value 'Pouring tea...'
    'Pouring tea...'
}
else {
    'NO POWER'
}
