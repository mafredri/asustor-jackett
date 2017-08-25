0.7.1609:
* Update for ADM 3.0
* Update bundled Jackett to 0.7.1609

0.7.411:
* WARNING! This update is incompatible with the previous releases, you will likely lose your configuration
* Update bundled Jackett to 0.7.411
* Simplify `jacket-daemon` and `start-stop-daemon`
* Backup and restore the installed Jackett version (from now on)
* Backup and restore Jackett configuration
* Keep configuration inside the Jackett package (`/usr/local/AppCentral/jackett`)
* Keep mono keypairs backed up so that they retain compatibility with the Jackett configuration

0.7.219:
* Update bundled Jackett
* Fix creation of missing config directory causing Jackett not being able to start

0.7.164:
* Update bundled Jackett
* Do not trap the exit signal in the Jackett keepalive daemon

0.7.121:
* Add a jacket-daemon script to make sure Jackett is started if it has crashed
* Update Jackett to the latest version
* Since the last update, Jackett supports auto-updates

0.7.75:
* Switch to https://github.com/Jackett/Jackett which is a maintained fork of the original Jackett
* Update to the latest version

0.6.9-r2:
* Fix symlinking of config
* Fix assigning of PID to Jackett
* Repackage Jackett.Binaries.Mono.v0.6.9.tar.bz2, there was a problem extracting it on the NAS

0.6.9:
* Verison bump

0.6.8:
* Initial release on Asustor
