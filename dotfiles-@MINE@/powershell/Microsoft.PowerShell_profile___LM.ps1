#Logon Banner
write-host -fore green  '##########################################'
write-host -fore yellow '## get-netadapter       <-- shows ifconfig'
write-host -fore yellow '## $env:path -split ";" <-- shows env-vars'
write-host -fore red    '## gdr                  <-- df -kh in Windows!!!!'
write-host -fore yellow '## cev == Get-EventLog -LogName * | ForEach {Clear-EventLog $_. log}'
write-host -fore yellow '## ev(2) =  get-eventlog -log syst -new 40 -Ent warn|sel mes -Uniq|fl|les'
write-host -fore yellow '## c(cn) = cd chocolatey (nas), cv=choco enabl -n=chocolatey'
write-host -fore yellow '## vagbuntu = vagrant init ubuntu/jammy64 --provider virtualbox; vagrant up'
write-host -fore yellow '## v = cd vscode (nas)'
write-host -fore blue   '## shift+rightclick a .ico file > copy as path'
write-host -fore green  '## PSReadline2.1 has... Set-PSReadLineOption -PredictionSource History"'
write-host -fore green  '##########################################'
write-host -fore blue   'VSCODEEESHORTCUT# CtrlP > @ lets you jump to another function in cur file, # is Global Symbol Search'
write-host -fore blue   'VSCODEEESHORTCUT# Highlight block > Ctrl+D === Multi Line Editor!!!!!'

#Setting Aliases
Set-PSReadLineOption -PredictionSource History
Set-Alias -Name l -Value 'ls' -Description 'The mighty L L'
Set-Alias -Name ll -Value 'ls' -Description 'The mighty L L'
Set-PSReadLineOption -PredictionSource History #Powershell with predictive history 

#Powershell Functions
function chocosources { choco sources list }
Set-Alias -name cs -value chocosources
function chocn { choco sources disable -n=chocolatey ; choco sources enable -n=lm-nexus }
function cev { Get-EventLog -LogName * | ForEach { Clear-EventLog $_.log } }
Set-Alias -name cev -value cev
function fev { get-eventlog -log system -newest 40 -EntryType error | select message -Unique | fl }
Set-Alias -name ev2 -value fev
function fev2 { get-eventlog -log system -newest 40 -EntryType warning | select message -Unique | fl}
Set-Alias -name ev -value fev2
function aev2 { get-eventlog -log Application -newest 40 -EntryType error,Warning | select message -Unique }
Set-Alias -name aev -value aev2
Set-Alias -name cn -value chocn
function chocc { choco sources disable -n=lm-nexus ; choco sources enable -n=chocolatey }
Set-Alias -name cc -value chocc
function choc { set-location \\lm-nas\OrioleNAS-Data\Software\chocolatey }
Set-Alias -name c -value choc
function vscode { set-location \\lm-nas\OrioleNAS-Data\Software\VSCode }
Set-Alias -name v -value vscode
function uptimef { (get-date) - ((gcim win32_operatingsystem).LastBootUpTime) }
Set-Alias -name uptime -value uptimef
function vagrant-new-ubuntu { 
  write-host -fore green "Making a Ubuntu 2204 VM with NAME=CWD of your current working dir..."
  start -wait "vagrant" -arg "init ubuntu/jammy64"; 
  start -wait "vagrant" -arg "up --provider virtualbox"
}
set-alias -name vagbuntu -value vagrant-new-ubuntu








write-host -fore cyan "**MULTIPASS LS**"
multipass ls

write-host -fore cyan "**VBOXMANAG LS**"
vboxmanage list vms --long | grep.exe -e "Name:" -e "State:" | grep.exe -v "vagrant.,"

# write-host -fore cyan "**VAGRANT LS**"
# vagrant global-status

# write-host -fore cyan "**DOCKER PS (Names/Status)**"
# docker ps -a
# docker ps -a --format "table {{.Names}} \t| {{.Status}}"

# `df -kh`
gdr| ? { $_.Root -like '*:*' }