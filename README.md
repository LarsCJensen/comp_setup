# comp_setup
Repositiory with installations for a new computer
`installer.bat` installs all general applications
`dev.bat` installs all developer tooling.

# pre-requisites
Update Windows App installer through Windows Store
If `winget install` still doesn't work run:
`Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe`
`winget source update`
