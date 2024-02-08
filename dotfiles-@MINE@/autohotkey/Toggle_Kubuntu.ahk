; Ctrl + M ==> Toggle VMware Kubuntu Dev VM (instead of MobaX Toggle)
^m::

; Globals
#UseHook
#SingleInstance force
#NoEnv
ListLines Off

; Filter on the VMware Player/Workstation Title (Used Process Hacker's {Window Title} column!)
; vmtitle := "MYDEVUBUNTUVM1404 - VMware Workstation"
; vmtitle := "MYDEVUBUNTUVM1604 - VMware Workstation"
; vmtitle := "MYDEVUBUNTUVM1804 - VMware Workstation"
; vmtitle := "MYDEVUBUNTUVM2004 - VMware Workstation"
vmtitle := "MYDEVUBUNTUVM2204 - VMware Workstation"
WinGetTitle, title, A

if (title = vmtitle)
{
    ; MsgBox, Hello World, its full screened.. trying to WinMinimize (I changed VMware Player default ALT KEY)
    Send, {LAlt}
    Sleep, 50
    WinMinimize %title%
    return
}
else
{
    WinActivate, %vmtitle%
    return
}




; ; ANOTHER WORKING VERSION IS:
; ; This script will map ctrl+m <=> toggle my fullscreen'ed VMware Workstation VM of Kubuntu.
; ^m::                                ; Ctrl + m map

; ; Global Script Settings
; #UseHook
; #SingleInstance force
; #NoEnv
; ListLines Off

; ; The "Window Title" of the VM (from Process Hacker 2):
; ; vmtitle := "LM-KDE (rm VM) - VMware Workstation"

; WinGetTitle, title, A
; if (title = vmtitle)
; {
;     MsgBox, Fullscreened... trying to minimize
;     Send, {LAlt}
;     Sleep, 50
;     WinMinimize %title%
;     return
; }
; else
; {
;     WinActivate, %vmtitle%
;     return
; }
; ; MsgBox, The active window's title is "%title%".
