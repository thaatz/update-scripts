# update-scripts

just a collection of my personal computer software update scripts

most of the software is listed on their own lines so i can easily choose which software to install or not by commenting out the lines one by one

## Alternatives
- `choco outdated` will list all your outdated packages from chocolatey. You can parse this list and then run an update on all those. Downside is that you can't set custom command line arguments for the packages that support arguments
- `choco upgrade all -y`
  - same downside mentioned in `choco outdated`
  - https://chocolatey.org/docs/commandsupgrade
- maybe in the future i should make use of `choco pin` to aleveate this issue?
  - https://chocolatey.org/docs/how-to-install-upgrade-package-without-scripts
- To have choco remember parameters on upgrade use `choco feature enable -n=useRememberedArgumentsForUpgrades`

## GitKraken
- latest release always at https://release.gitkraken.com/win64/GitKrakenSetup.exe
  - alternatively https://release.axocdn.com/win64/GitKrakenSetup.exe
  - https://repology.org/project/gitkraken/packages
  - mac https://iusethis.luo.ma/gitkraken/
- previous releases at `release.gitkraken.com/[PLATFORM]/GitKrakenSetup-[X.Y.Z].exe`
  - `[PLATFORM]` is windows64, windows, mac, linux-deb, linux-gzip, or linux-rpm
    - append `-standalone` for the standalone version
      - eg. `win64-standalone`
    - Windows 64 bit `windows64/GitKrakenSetup-[X.Y.Z].exe`
    - Windows 32 bit `windows/GitKrakenSetup-[X.Y.Z].exe`
    - Mac `darwin/installGitKraken.dmg` ???
    - Linux-deb `linux/gitkraken-v[X.Y.Z].deb`
    - Linux-gzip `linux/gitkraken-v[X.Y.Z].tar.gz`
    - Linux-rpm `linux/gitkraken-v[X.Y.Z].rpm`
  - `[X.Y.Z]` is the version number 
    - [full changelog](https://support.gitkraken.com/release-notes/current/)
  - eg. https://release.gitkraken.com/win64/GitKrakenSetup-7.3.2.exe
    - alternatively https://release.axocdn.com/win64/GitKrakenSetup-7.3.2.exe