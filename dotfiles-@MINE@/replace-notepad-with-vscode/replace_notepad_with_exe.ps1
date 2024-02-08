# This is just a quick DANGEROUS powershell script so that whenever you do 
# start > run > notepad, you launch a vscode (newwin config manually required with ctrl+,), or a notepad++ window
# (((NOTE: Can brake your OS if you dont know what you are doing...)))
$ErrorActionPreference=0
$exefile= "%ProgramFiles(x86)%\Notepad++\notepad++.exe"

write-host -fore yellow "WARNING THIS CAN BREAK YOUR SYSTEM!"
write-host -fore yellow "WARNING THIS CAN BREAK YOUR SYSTEM!"
write-host -fore yellow "WARNING THIS CAN BREAK YOUR SYSTEM!"
write-host -fore green "Continue, if you want notepad.exe to be replaced with..."
write-host -fore green $exefile
pause

write-host -fore green "Setting registry to point at executable: $exefile"
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "\"$($exefile)\" -notepadStyleCmdline -z" /f

write-host "Script Complete. Registry modified. Try to run Start > Run... > and type (notepad), to see what happens... I guess?"

# to undo, just do something like this:
# reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /f
