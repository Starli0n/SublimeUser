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

### Self-Installer
`Super+Shift+P User: Install`

### UTF-8 Support
- Copy `Packages/User/Resources/Any/Default/exec.py` To `Packages/Default/exec.py`

### Firefox Add-on
- Open selection in Sublime Text from context menu

https://github.com/Starli0n/FireSublimeText


[OSX] INSTALL
-------------

### Create some alias
````
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
ln -s "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Resources/OSX/HOME/.gitconfig" "$HOME/.gitconfig"
ln -s "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Resources/OSX/HOME/.bash_profile" "$HOME/.bash_profile"
ln -s "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Resources/OSX/HOME/.MacOSX" "$HOME/.MacOSX"
````

### Customize Finder toolbar to open file in Sublime Text
- TODO

### Configure FileDiff command
- Edit `Packages/User/FileDiffs.sublime-settings`
- Replace by `/usr/local/bin/bcomp` for Beyond Compare

### Change font size
- Edit `Packages/User/Preferences.sublime-settings`
- Replace by `"font_size": 15.0`

### Copy Path to Clipboard
- Copy `Packages/User/Resources/OSX/HOME/Library/Services/Copy Path to Clipboard.workflow` to `~/Library/Services/Copy Path to Clipboard.workflow`
- Add a shorcut `Super+Shift+C` (System Preferences > Keyboard > Application Shortcuts)

### Show hidden files with a widget
- Copy `Packages/User/Resources/OSX/HOME/Library/Widgets/HiddenFiles.wdgt` to `~/Library/Widgets/HiddenFiles.wdgt`

### Change keyboard layout
- Copy `Packages/User/Resources/OSX/HOME/Library/Keyboard Layouts/*` to `~/Library/Keyboard Layouts/*`
- System Preferences > Laguage & Text > Input Sources > French X-Coding


[WIN] INSTALL
-------------

### Usefull binaries
- Include this path to `%PATH%` Environment Variable
	- `C:\Tools\SublimeText\Data\Packages\User\Resources\Windows\bin`
- Execute batch files (*.bat or *.cmd) or python scripts (*.py) in Sublime Text (Ctrl+B)
- Call Sublime Text from a MS-DOS Console (> subl file_name)
- Shortcut for git command in a MS-DOS Console (> g git_commands_params)
- Add syntax highlighting for Git global config (Require Python) (> git g)

### Create an alias `.gitconfig`
`mklink  %HOMEDRIVE%%HOMEPATH%.gitconfig C:\Tools\SublimeText\Data\Packages\User\Resources\Windows\HOME\.gitconfig`

### Add Sublime Text to the right click context menu
- Edit the file `Packages/User/Resources/Windows/Tools/SublimeTextRightClickContextMenu.reg`
- Replace `C:\\Tools\\SublimeText\\` by your installation directory (Pay attention to replace `\` by `\\`)
- Save and execute `SublimeTextRightClickContextMenu.reg`

### Configure FileDiff command
- Edit `Packages/User/FileDiffs.sublime-settings`
- Configure WinMerge path
- A WinMerge filter for Sublime Text Package `Packages/User/Resources/Windows/Tools/SublimeTextWinmergeFilter.flt`

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
- In Finder, press Super+Shift+G and paste this directory
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

### [WIN] Install XDebug with XAMPP
- Download the right version of XDebug according your XAMPP version, prefer a TS one (TS stands for Thread Safe)
 	- https://xdebug.org/download.php
- Copy the file to the ext location of PHP
	- `C:\xampp\php\ext\php_xdebug.dll`
- Open php.ini normaly there `C:\xampp\php\php.ini`
- Append the following lines to the bottom of the file
````
[xdebug]
zend_extension = "C:/xampp/php/ext/php_xdebug.dll"
xdebug.idekey=sublime.xdebug
xdebug.remote_enable=1
xdebug.show_local_vars=1
xdebug.remote_log=C:/xampp/php/logs/xdebug.log
````
- Add an environment variable
	- `XDEBUG_SESSION=sublime.xdebug`
- Restart Apache
- Test the installation by searching for "XDebug" on a phpinfo() page

### Install Firefox Add-on
- easy Xdebug
	- https://addons.mozilla.org/en-US/firefox/addon/easy-xdebug-with-moveable-
	- Change `Value of the debug cookie` to `sublime.xdebug`
- LiveReload
	- https://addons.mozilla.org/en-US/firefox/addon/livereload/

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


PHPUNIT
-------

PHPUnit requires the install of XDebug

### [WIN] Install PHPUnit
- Include the path `C:\Tools\System` to `%PATH%` Environment Variable
- Include the path `C:\xampp\php` to `%PATH%` Environment Variable
- Execute the following command
	- `C:\Tools\System>echo @php "%~dp0phpunit.phar" %* > phpunit.cmd`
- Download the last version of PHPUnit
	- https://phar.phpunit.de/phpunit.phar
- Copy it to `C:\Tools\System\phpunit.phar`
- Test the installation
	- `phpunit --version`
- Test PHPUnit with the following command on a configured project
	- `phpunit --coverage-html=./report --bootstrap=./bootstrap.php`


COMPOSER
--------

### [WIN] Install Composer
- Include the path `C:\Tools\System` to `%PATH%` Environment Variable
- Execute the following command
	- `echo @php "%~dp0composer.phar" %*>composer.cmd`
- Setup proxy without `http(s)://` if needed
````
@set HTTP_PROXY=<proxy>:<port>
@set HTTPS_PROXY=<proxy>:<port>
````
- Execute the following commands in `C:\Tools\System`
````
> php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
> php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === 'fd26ce67e3b237fffd5e5544b45b0d92c41a4afe3e3f778e942e43ce6be197b9cdc7c251dcde6e2a52297ea269370680') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }"
> php composer-setup.php
> php -r "unlink('composer-setup.php');"
````
- Test the installation
	- `composer --version`
- Basic commands
````
> composer init
> composer install
> composer update
> composer dump-autoload -o
````


PACKAGE DEVELOPMENT
-------------------

### Create a Release and a Development environment
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

### Use Python [Plugin Debugger](https://sublime.wbond.net/packages/Plugin%20Debugger)
- Install [Winpdb](http://winpdb.org/download)
	- `python setup.py install --record winpdb.txt`
- Install the [wxPython runtime](http://www.wxpython.org/download.php)
- After the installation, change shortcuts in `PYDIR/Lib/site-packages/winpdb.py` to Visual Studio like
````
AC_CHAR = "\t"
AC_EXIT = "Alt-X"
AC_ANALYZE = "F3"
AC_BREAK = "F4"
AC_GO = "F5"
AC_NEXT = "F10"
AC_STEP = "F11"
AC_GOTO = "Ctrl-F10"
AC_TOOGLE = "F9"
AC_RETURN = "Shift-F11"
````


[OSX] PACKAGE DEVELOPMENT
-------------------------

- Copy `Packages/User/Resources/OSX/Library/Services/• Sublime Packages.workflow` to `~/Library/Services/• Sublime Packages.workflow`
- Switch to Release mode `Packages.ctrl`
	- Right click on the folder and execute the service `• Sublime Packages.workflow`
- Switch to Dev mode `Packages.git`
	- Right click on the folder and execute the service `• Sublime Packages.workflow`


[WIN] PACKAGE DEVELOPMENT
-------------------------

- Copy `Packages/User/Resources/Windows/bin/Junction.exe` To `C:\Tools\System\junction.exe`
- Include the path `C:\Tools\System` to `%PATH%` Environment Variable
- Copy `Data/Packages/User/Resources/Windows/InstallDir/Data/*` To `Data/*`
- Switch to Release mode `Packages.ctrl`
	- Run the shortcut `sublime_text_pkg.ctrl.bat`
- Switch to Dev mode `Packages.git`
	- Run the shortcut `sublime_text_pkg.git.bat`
- Fetch all Git package
	- Run `Packages/User/Resources/Windows/PackageFetch.bat`


TIPS
----

### Update Project List
- Open the file `Settings/Session.sublime_session` with another editor
- Update the list `workspaces > recent_workspaces`
