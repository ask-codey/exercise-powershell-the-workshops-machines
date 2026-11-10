# The oil can, by Ada Wren. Call it by name, from any folder: oil gears
# It works only when called by its name, so its folder has to be on your PATH. Then it writes oiled.txt
# in the folder above tools.
if ($MyInvocation.InvocationName -notin 'oil', 'oil.ps1') {
    'Call me by name: put my folder on your PATH, then type: oil gears'
}
else {
    $message = "Glug, glug. The $($args[0]) are oiled and shining."
    Set-Content -Path (Join-Path (Split-Path $PSScriptRoot) 'oiled.txt') -Value $message
    $message
}
