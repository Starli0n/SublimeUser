SublimeUser
===========

My Sublime Text User folder


PRE-INSTALL
-----------

- Prerequisite: Git must be installed
- Fork the project: https://github.com/Starli0n/SublimeUser to F_SublimeUser


INSTALL
-------

### Install the software
- Download the portable version for Windows (http://www.sublimetext.com/2)
- [WIN] Install to C:\Tools\SublimeText
- Backup `Data/Packages` To `Data/Packages.New`
- Install Package Control (https://sublime.wbond.net/installation#st2)

### Replace the User package configuration
- Close Sublime Text
- Delete the folder `Data/Packages/User`
- Open a terminal here: `Data/Packages`
- Execute the following commands (replace `<user>` by your user name)
```
> git clone https://<user>@github.com/<user>/F_SublimeUser.git User
> cd User
> git config user.name <user>
> git config user.email <user>@users.noreply.com
> git remote add --track master upstream https://github.com/Starli0n/SublimeUser.git
```

### UTF-8 Support
- Copy `Packages/User/Resources/exec.py` To `Data/Packages/Default/exec.py`


[OSX] INSTALL
-------------

### TODO


[WIN] INSTALL
-------------

### Add Sublime Text to the right click context menu
- Edit the file `Data/Packages/User/Resources/Windows/SublimeText.reg`
- Replace `C:\\Tools\\SublimeText\\` by your installation directory (Pay attention to replace `\` by `\\`)
- Save and execute `SublimeText.reg`

### Execute batch file (*.bat or *.cmd) in Sublime Text (Ctrl+B)
- Copy `Data/Packages/User/Resources/Windows/$InstallDir/Sublime.bat` To `Sublime.bat`
- Edit `Data/Packages/User/Batch File.sublime-build`
- Replace `C:\\Tools\\SublimeText\\` by your installation directory (Pay attention to replace `\` by `\\`)

### Call Sublime Text from a MS-DOS Console (> subl file_name)
- Copy `Data/Packages/User/Resources/Windows/subl.bat` To `C:\Tools\System\subl.bat`
- Add `C:\Tools\System` to `PATH` Environment Variables

### Configure WinMerge path
- Configure WinMerge path, edit `Data/Packages/User/FileDiffs.sublime-settings`
- A WinMerge filter for Sublime Text Package `Data/Packages/User/Resources/Windows/Winmerge/SublimeText.flt`


[OSX] DEVELOP PACKAGE
---------------------

### TODO


[WIN] DEVELOP PACKAGE
---------------------

- Unzip `Data/Packages/User/Resources/Windows/Junction.zip` To `C:\Tools\System\junction.exe`
- Add `C:\Tools\System` to `PATH` Environment Variables
- Copy `Data/Packages/User/Resources/Windows/$InstallDir/Data/*` To `Data/*`
- Close Sublime Text
- Rename `Data/Packages` To `Data/Packages.ctrl`
- Copy `Data/Packages.ctrl` To `Data/Packages.git`
- Create file `Data/Packages.ctrl/PackageControl`
- Create a file `Data/Packages.git/PackageControl.Git`
- Add `Data/Packages.git/YAML/Main.sublime-menu` file
```
[
    {
        "caption": ".git",
        "id": "id"
    }
]
```

### Own Sublime Package Control Channel: package_control.git
- Open a terminal here: `Data/Packages.git`
- Execute the following commands (or Fork the project before)
```
> git clone https://Starli0n@github.com/Starli0n/SublimePackages.git package_control.git
> cd package_control.git
> git config user.name Starli0n
> git config user.email Starli0n@users.noreply.com
```

### Sublime Package Control Default Channel: package_control_channel.git
- Fork the project `https://github.com/wbond/package_control_channel.git`
- Open a terminal here: `Data/Packages.git`
- Execute the following commands
```
> git clone https://Starli0n@github.com/Starli0n/f_package_control_channel.git package_control_channel.git
> cd package_control_channel.git
> git config user.name Starli0n
> git config user.email Starli0n@users.noreply.com
> git remote add --track master upstream https://github.com/wbond/package_control_channel.git
```

- `Data/Packages.git/User/Package Control.sublime-settings` should be something like
```
"repositories":
[
	"https://raw.github.com/Starli0n/SublimePackages/master/repository.json",
	"https://raw.github.com/Starli0n/SublimePackages/master/forked_repository.json"
]
```

### Develop a package `MyPackage`
- A new package should be added to `Data/Packages/package_control.git/repository.json`
- A forked package should be added to `Data/Packages/package_control.git/forked_repository.json`
- Commit and Push modifications
- If exists delete the folder `MyPackage` form `Data/Packages.git`
- Open a terminal here: `Data/Packages.git`
- Execute the following commands
```
> git clone https://Starli0n@github.com/Starli0n/MyPackage.git MyPackage
> cd MyPackage
> git config user.name Starli0n
> git config user.email Starli0n@users.noreply.com
```

### Switch to Release mode `Data/Packages.ctrl`
- Run the shortcut `sublime_text_pkg.ctrl.bat`

### Switch to Dev mode `Data/Packages.git`
- Run the shortcut `sublime_text_pkg.git.bat`


TIPS
----

### Update Project List:
- Open the file `Data/Settings/Session.sublime_session` with another editor
- Update the list `workspaces > recent_workspaces`
