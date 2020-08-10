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