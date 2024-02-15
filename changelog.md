### v2.2.0 - 14.02.2024
* ???

### v2.1.0 - 13.11.2022
* NASA-themed raidenTweaks initial release
* Rebuilt unlockers
* Fix unlockers not working
* Fix auto profile not working properly
* Fix performance and thermal profiles not applying in auto profile
* Fix conflict with fstrim binary
* Redesigned logs interface
* Redesigned magisk installation panel
* Redesigned main app
* Redesigned uninstall system
* Pastel colors for each profile in the main app
* New icons for each profile in the main app
* Minimally improved main app rounded corners
* Improved functions.sh 
* Improved raidenTweaks menu descriptions
* Improved log upload system
* Improved cleaner binary 
* Improved fstrim binary (will now be rfstrim)
* Improved module prop
* Improved option to optimize app package in menu
* Added success or failure exit system when applying profiles
* Added system of updating files whenever device is rebooted twice
* Added option to choose branch for required files
* Added option to define which profile will be applied after reboots
* Added a specific menu to choose low memory killer profiles (this feature is exclusively created by me, if you see this elsewhere without the credits, that's kang!)
* Added a specific menu to select unlockers
* Added build.sh to zip the files and create a new release
* Added new apps to auto profile
* Added option to enable/disable low ram mode in menu
* Added new boot detection system in service.sh
* LPM sleep disable removed
* Removed several useless things
* Changed main app package and icon
* Icon for toast app changed
* Four core will shut down when battery reaches 5% in certain profiles with simple usage
* Other minor changes...

### v2.0.0 - 18.09.2022
* Core app with UX improvement
* Rollback to old and working unlockers (temp)
* Removal of obsolete props
* Improved uninstall system
* Auto profile script fix
* Fix in the version that is shown in the logs
* Removal of obsolete permission
* Directory fix in uninstall.sh
* System to uninstall module from the menu has been improved
* System remove module has been improved, now the main application will be removed
* Fix main app not installing (older versions may not install the main app automatically)
* Easter egg removed from menu
* Persist added to fstrim

### v1.9.0 - 18.08.2022
* Changes to the installation script 
* Attempt to fix bugs in unlockers

### v1.8.0 - 15.08.2022
* Added fstrim when starting the system 
* Added new menu options (Disable and enable gapps whenever you want)
* Added new unlocker options on installation (Several new options, there are so many that it is not possible to mention them here.)
* Toast removed when applying clear ram in menu 
* Added notification when applying clear ram
* Fixed version in module.prop
* Remastering the installation script
* There's an easter egg somewhere.
* A few other small changes...

### v1.7.0 - 18.04.2022
* Zygisk issue has been resolved

### v1.6.0 - 10.04.2022
* GMS optimization enabled
* Remastering in the install script 
* Translation into different languages ​​in the app 
* New menu options (option to uninstall module, collect logs, low power mode...)
* Changes to all profiles 
* Added renice in some apps when applying profiles
* Updated base supporting current magisk versions
* Support since magisk 20.0+
* Added zygisk support
* Improvements in the menu
* update.json and changelog.md added
* Removing files to make it lighter
* The required files will be downloaded at installation (now whenever the module is updated on GitHub, just install it in your magisk)
* Removed option to optimize apps on installation (many were having difficulties with this)
* And some other adjustments...

### v1.5.0 - 26.11.2021
* Conflict checker (when installing the module)
* Main script remastered
* Fixes in tweaks
* Toast when applying profiles (toasts are in english and portuguese, it will detect your language automatically)
* Toast when running clear ram from the menu
* Option to clean trash added to menu (Removal of unnecessary files)
* Option to remove module via menu
* Menu display changes
* Added unlocker for some games
* Application image change
* Some other adjustments...

### v1.4.0 - 18.10.2021
* Changing icons in the app. 
* New tweaks for each profile.
* Menu interface remaster.
* New menu functions. (stop thermal, clear ram with 3 different execution modes).
* Fixed a bug in the logs (the logs didn't work).
* Fixed bugs in the menu (menu did not close...)
* Minor other fixes...

### v1.3.0 - 05.10.2011
* New application interface (few changes)
* New tweaks in each profile
* New menu with several possibilities (among them the option to change profile)
* Possibility to clear battery status, compile application packages and do fstrim (all this on the menu)
* Fixed infinite logs bug (logs using a lot of memory)
* Minor modifications to the installation interface
* Added menu logs 
* New logs interface (application of profiles)
* Other minor fixes...

### v1.2.0 - 11.09.2021
* Application bug not working after restart fixed.
* Uncontrolled logs fixed. (possibly)
* Installation in magisk has been rebuilt!
* Added options fstrim/compile apps packages on installation.
* Small adjustments to profiles.

### 1.1.0 - 21.07.2021
* General corrections.
* Menu removed
* Semantic versioning.
* Profile corrections.
* Added new profile "thermal" to keep the device cold.
* Internet, zram tweaks included.
* Several new tweaks adjusted.
* Logs at the root of internal storage.
* And various other things...

### v1.0.0 - 25.02.2021
* Initial release