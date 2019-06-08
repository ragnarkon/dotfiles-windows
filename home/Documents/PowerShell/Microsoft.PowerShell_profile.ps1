function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
  $origLastExitCode = $LastExitCode

  Write-Host "[" -NoNewLine -ForegroundColor Gray
  if (Test-Administrator) {
    Write-Host "$env:USERNAME" -nonewline -ForegroundColor DarkRed
  } else {
    Write-Host "$env:USERNAME" -NoNewLine -ForegroundColor DarkGreen
  }
  Write-Host "@" -NoNewLine -ForegroundColor Gray
  Write-Host "$env:COMPUTERNAME" -nonewline -ForegroundColor DarkYellow
  Write-Host ":" -nonewline -ForegroundColor Gray

  Write-Host (Get-PromptPath) -nonewline -ForegroundColor DarkBlue
  Write-Host "]" -nonewline -ForegroundColor Gray
  #Write-Host (Get-Date -UFormat "%Y.%m.%d %H:%M:%S") -nonewline -ForegroundColor DarkMagenta
  & $GitPromptScriptBlock
  $LastExitCode = $origLastExitCode
}

Import-Module posh-git
$GitPromptSettings.DefaultPromptPath = ''
$GitPromptSettings.DefaultPromptSuffix = "`n$(">" * ($nestedPromptLevel + 1)) "