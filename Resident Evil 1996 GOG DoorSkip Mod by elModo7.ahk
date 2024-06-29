; Version 0.1 Target GOG
#NoEnv
#SingleInstance, Force
TrayTip,RE DoorSkip by elModo7, Waiting for ResidentEvil.exe (GOG) to be active
WinWaitActive,ahk_exe ResidentEvil.exe
WinGet,hWnd,ID,ahk_exe ResidentEvil.exe
dir:=DllCall(A_PtrSize=4?"GetWindowLong":"GetWindowLongPtr","Ptr",hWnd,"Int",-6,A_Is64bitOS?"Int64":"UInt")+8261072
winget,pid,PID,ahk_exe ResidentEvil.exe
SetTimer,nd,10
~0::
nd:
DllCall("WriteProcessMemory","UInt",DllCall("OpenProcess","int",2035711,"char",0,"UInt",PID,"UInt"),"UInt",dir,"Uint*",0,"Uint",1,"Uint*",0)
DllCall("CloseHandle","int",DllCall("OpenProcess","int",2035711,"char",0,"UInt",PID,"UInt"))