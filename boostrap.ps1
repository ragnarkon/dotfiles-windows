$execDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# This don't work, I'll figure it out later.
# Nvm, it works
New-Item -Path $PROFILE -ItemType SymbolicLink -Value $execDir\home\Documents\PowerShell\Microsoft.PowerShell_profile.ps1