SublimeUser
===========

My Sublime Text User folder


PRE-INSTALL
-----------

- Prerequisite: Git must be installed
- Fork the project: https://github.com/Starli0n/SublimeUser to F_SublimeUser


INSTALL
-------

### Package location
- [OSX] `/Users/Starli0n/Library/Application Support/Sublime Text 2/Packages`
- [WIN] `C:\Tools\SublimeText\Data\Packages` (Download the portable version)

### Install the software
- Download Sublime Text 2 (http://www.sublimetext.com/2)
- Backup `Packages` To `Packages.New`
- Install Package Control (https://sublime.wbond.net/installation#st2)

### Replace the User package configuration
- Close Sublime Text
- Delete the folder `Packages/User`
- Open a terminal here: `Packages`
- Execute the following commands (replace `<user>` by your user name)
```
> git clone https://<user>@github.com/<user>/F_SublimeUser.git User
> cd User
> git config user.name <user>
> git config user.email <user>@users.noreply.com
> git remote add upstream https://github.com/Starli0n/SublimeUser.git
```

### UTF-8 Support
- Copy `Packages/User/Resources/exec.py` To `Packages/Default/exec.py`

### Firefox Add-on
- Open selection in Sublime Text from context menu

https://github.com/Starli0n/FireSublimeText


[OSX] INSTALL
-------------

### Create an alias `subl`
`ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`

### Customize Finder toolbar to open file in Sublime Text
- TODO

### Customize bash profile to open file from a terminal (> subl file_name)
- Copy `Packages/User/Resources/OSX/$HOME/.bash_profile` To `~/.bash_profile`
- Update `~/.bashrc` by `Packages/User/Resources/OSX/$HOME/.bashrc`

### Configure FileDiff command
- Edit `Packages/User/FileDiffs.sublime-settings`
- Replace by `/usr/local/bin/bcomp` for Beyond Compare

### Change font size
- Edit `Packages/User/Preferences.sublime-settings`
- Replace by `"font_size": 15.0`

### Configure Diff and Merge tools for Git
- Copy `Packages/User/Resources/OSX/$HOME/merge.sh` To `~/merge.sh`

### Add Git to PATH environment variable
- Copy `Packages/User/Resources/OSX/$HOME/.MacOSX` To `~/.MacOSX`

### Copy Path to Clipboard
- Copy `Packages/User/Resources/OSX/$HOME/Library/Services/Copy Path to Clipboard.workflow` to `~/Library/Services/Copy Path to Clipboard.workflow`
- Add a shorcut `Shift+Super+C` (System Preferences > Keyboard > Application Shortcuts)

### Show hidden files with a widget
- Copy `Packages/User/Resources/OSX/$HOME/Library/Widgets/HiddenFiles.wdgt` to `~/Library/Widgets/HiddenFiles.wdgt`

### Change keyboard layout
- Copy `Packages/User/Resources/OSX/$HOME/Library/Keyboard Layouts/*` to `~/Library/Keyboard Layouts/*`
- System Preferences > Laguage & Text > Input Sources > French X-Coding


[WIN] INSTALL
-------------

### Create a system directory
- Create `C:\Tools\System`
- Add the path to `%PATH%` Environment Variables

### Add Sublime Text to the right click context menu
- Edit the file `Packages/User/Resources/Windows/Tools/SublimeTextRightClickContextMenu.reg`
- Replace `C:\\Tools\\SublimeText\\` by your installation directory (Pay attention to replace `\` by `\\`)
- Save and execute `SublimeTextRightClickContextMenu.reg`

### Execute batch file (*.bat or *.cmd) in Sublime Text (Ctrl+B)
- Copy `Packages/User/Resources/Windows/$InstallDir/Sublime.bat` To `Sublime.bat`
- Edit `Packages/User/Batch File.sublime-build`
- Replace `C:\\Tools\\SublimeText\\` by your installation directory (Pay attention to replace `\` by `\\`)

### Call Sublime Text from a MS-DOS Console (> subl file_name)
- Copy `Packages/User/Resources/Windows/$SYSTEM/subl.bat` To `C:\Tools\System\subl.bat`

### Shortcut for git command in a MS-DOS Console (> g git_commands_params)
- Copy `Packages/User/Resources/Windows/$SYSTEM/g.bat` To `C:\Tools\System\g.bat`

### Configure FileDiff command
- Edit `Packages/User/FileDiffs.sublime-settings`
- Configure WinMerge path
- A WinMerge filter for Sublime Text Package `Packages/User/Resources/Windows/Tools/SublimeTextWinmergeFilter.flt`

### Configure Diff and Merge tools for Git
- Copy `Packages/User/Resources/Windows/$SYSTEM/merge.sh` To `C:\Tools\System\merge.sh`

### Add `Copy Path to Clipboard` feature to the right click context menu
- Install `Packages/User/Resources/Windows/Tools/ClipboardPath_Setup.exe`
- Add an icon `Packages/User/Resources/Windows/Tools/ClipboardPath_Setup.exe.reg`


XDEBUG
------

### [OSX] Install XDebug (or use a package with preinstalled XDebug like XAMP or MAMP)
- Dowload pre-compiled PHP extension from ActiveState for Mac OS X
	- http://aspn.activestate.com/ASPN/Downloads/Komodo/RemoteDebugging
- Unarchive the downloaded file
- Enter the appropriated directory and find the file named "xdebug.so"
- In Finder, press Cmd+Shift+G and paste this directory
	- `/usr/lib/php/extensions/no-debug-non-zts-20090626/`
- Drag & Drop "xdebug.so" file to this directory
- Open php.ini normaly there `/private/etc/php.ini`
- Append the following lines to the bottom of the file
````
[xdebug]
zend_extension=/usr/lib/php/extensions/no-debug-non-zts-20090626/xdebug.so
xdebug.idekey=sublime.xdebug
xdebug.remote_enable=1
xdebug.show_local_vars=1
xdebug.remote_log=/tmp/xdebug.log
````
- Tweak configuration setting
	- http://xdebug.org/docs/all_settings
- Restart the Apache web server from a terminal
````
> export XDEBUG_SESSION=sublime.xdebug
> sudo /usr/sbin/apachectl restart
````
- Test the installation by searching for "XDebug" on a phpinfo() page

### Install Firefox Add-on
- easy Xdebug
	- https://addons.mozilla.org/en-US/firefox/addon/easy-xdebug-with-moveable-
	- Change `Value of the debug cookie` to `sublime.xdebug`
- LiveReload
	- http://download.livereload.com/2.0.8/LiveReload-2.0.8.xpi

### Apache
- Restart service with `XDEBUG_SESSION=sublime.xdebug`
- Check the value on phpinfo() page

### Run a XDebug session
- Firefox
	- Open the PHP file to debug
	- Activate LiveReload on this file
	- Toggle xdebug cookie (red->active)
- Sublime Text
	- Add some breakpoints on the code (F9)
	- `Start debugging` (Shift+F5)
	- Save the file to debug to activate the live reloading
- if the debug session does not work, restart Apache, Firefox and Sublime Text


[OSX] PACKAGE DEVELOPMENT
-------------------------

### TODO
- Copy `Packages/User/Resources/OSX/Library/Services/• Sublime Packages.workflow` to `~/Library/Services/• Sublime Packages.workflow`


[WIN] PACKAGE DEVELOPMENT
-------------------------

- Unzip `Packages/User/Resources/Windows/Tools/Junction.zip` To `C:\Tools\System\junction.exe`
- Copy `Data/Packages/User/Resources/Windows/$InstallDir/Data/*` To `Data/*`
- Close Sublime Text
- Rename `Packages` To `Packages.ctrl`
- Copy `Packages.ctrl` To `Packages.git`
- Create file `Packages.ctrl/PackageControl`
- Create a file `Packages.git/PackageControl.Git`
- Add `Packages.git/YAML/Main.sublime-menu` file
```
[
    {
        "caption": ".git",
        "id": "id"
    }
]
```

### Own Sublime Package Control Channel: package_control.git
- Open a terminal here: `Packages.git`
- Execute the following commands (or Fork the project before)
```
> git clone https://Starli0n@github.com/Starli0n/SublimePackages.git package_control.git
> cd package_control.git
> git config user.name Starli0n
> git config user.email Starli0n@users.noreply.com
```

### Sublime Package Control Default Channel: package_control_channel.git
- Fork the project `https://github.com/wbond/package_control_channel.git`
- Open a terminal here: `Packages.git`
- Execute the following commands
```
> git clone https://Starli0n@github.com/Starli0n/f_package_control_channel.git package_control_channel.git
> cd package_control_channel.git
> git config user.name Starli0n
> git config user.email Starli0n@users.noreply.com
> git remote add --track master upstream https://github.com/wbond/package_control_channel.git
```

- `Packages.git/User/Package Control.sublime-settings` should be something like
```
"repositories":
[
	"https://raw.github.com/Starli0n/SublimePackages/master/repository.json",
	"https://raw.github.com/Starli0n/SublimePackages/master/forked_repository.json"
]
```

### Develop a package `MyPackage`
- A new package should be added to `Packages/package_control.git/repository.json`
- A forked package should be added to `Packages/package_control.git/forked_repository.json`
- Commit and Push modifications
- If exists delete the folder `MyPackage` form `Packages.git`
- Open a terminal here: `Packages.git`
- Execute the following commands
```
> git clone https://Starli0n@github.com/Starli0n/MyPackage.git MyPackage
> cd MyPackage
> git config user.name Starli0n
> git config user.email Starli0n@users.noreply.com
```

### Switch to Release mode `Packages.ctrl`
- Run the shortcut `sublime_text_pkg.ctrl.bat`

### Switch to Dev mode `Packages.git`
- Run the shortcut `sublime_text_pkg.git.bat`

### Fetch all Git package
- Run `Packages/User/Resources/Windows/PackageFetch.bat`


TIPS
----

### Update Project List
- Open the file `Settings/Session.sublime_session` with another editor
- Update the list `workspaces > recent_workspaces`
