# Current Dotfiles:
Notable used resource config files are...
| Dotfile                      | Path                  | Description         |
| :---                         |    :----:             |          ---:       |
| Autohotkey                   | N/A                   | Auto minimizing VMs |
| Bash                         | ~/.bashrc             | LiveCD config.      |
| Fish                         | ~/.config/fish/config.fish        | Fish Greetings | 
| Powershell                   | ~/.config/powershell  | LiveCD, and LM.     |
| SSH Client  | ~/.ssh                | SSH Client Config   |
| Terminator                   | ~/.config/terminator  | Terminator w/Ub     |
| VMware Workstation | ~/.config/autostart   | Autostarting VMs.  |
| Zsh                          | ~/.zshrc              | LiveCD config.      |


# Other Random Notes (VSCode):
* "." in github.com repo, and it will open vscode online in the repository you are in.

* ```Ctrl + K >> V```, and this will preview a .MD file in your repo.

* ```Ctrl + P >> @```, and you can jump to symbols in code.

* ```Ctrl + \ >> Ctrl + P + FILENAME```, and you got a Splitted View with 2 diff files.

* Use ```git restore .``` instead of ```git reset --hard HEAD```

* Deleting Empty Lines (in ```vscode``` or ```sed```):
```
vscode: regex to delete empty lines:   ^(\s)*$\n
sed:    sed '/^$/d' <-- delete empy lines
```

# Yellow Stickies
```
LINUX:
tcpdump -ni
docker rm -f $(docker ps -qa) <--- rm's all containers
docker system prune <-- reset the whole docker
docker container logs -f ub01 <--- follows the logs of this
docker compose logs -f
docker compose restart
journalctl -fu myservice01 <-- TAILs a LINUX SERVICE LOG
dpkg -l <-- list installed apps
printf 'hello\nworld'
arping
ls ltrahS <-- Largest File @ Bottom
sed '/^$/d' <-- delete empy lines
sort -u <-- sort | uniq

VIM:
d/_ or dF_ <- deletes until next "underscore"
:below terminal
:terminal
:tabnew
gt
U or u <--- use in visual highlighted block to UPPERCASE it!!!
ciw <-- change inner word
daw <-- delete innerword + space
``  <-- bookmark and hop to last bookmarked! (not working in linux vscode vim addon, ugh!)

WINDOWS:
takeown /f $DIR /R /D Y
icacls $DIR /grant everyone:'(OI)(CI)F' /t
ncpa.cpl <-- `control netconnections`
robocopy emptydir dirtodelete /mir <-- use this to delete a folder which already is longer than 248 chars
everything.exe CAN GREP INSIDE FILES via "content:centosblahblah"
powershell.exe -ep bypass "ls"
get-netadapter | ft -auto
wmic nic get
$env:path -split(';') <-- then you can disable-netadapter
help about_array, or help *blah*
ls -force <-- is `ls -a` in pwsh
wsl --cd $PWD
vagrant init ubuntu/jammy64
vagrant up --provider virtualbox
intl.cpl <-- language format login screen
tasklist /svc <-- list services
WSUS: get-hotfix ; wmic qfe list ; dism /get-packages | findstr /i KB
start->run: lync, or microsoft-edge:
vscode: ctrl + D <-- highlights the next duplicate!!!!!
vscode: regex to delete empty lines:   ^(\s)*$\n

```