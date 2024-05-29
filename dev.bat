echo:
echo Installing recommended VSCode extensions
echo =========================================
echo:
winget install -e --id vscode
call "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code" --install-extension ms-vscode-remote.remote-wsl
call "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code" --install-extension eamodio.gitlens
call "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code" --install-extension ms-python.python
call "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code" --install-extension ms-python.vscode-pylance
call "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code" --install-extension ms-python.black-formatter
call "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code" --install-extension matangover.mypy
call "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code" --install-extension ms-python.pylint
echo:
echo Extensions installed
echo ====================
echo:

@echo off

wsl --status >nul 2>&1

if %ERRORLEVEL% EQU 50 (
    echo:
    echo Installing WSL with Ubuntu
    echo ==========================
    echo:

    wsl --install

    echo A reboot is required. Please run this script again once the reboot is done.
) else (
    if %ERRORLEVEL% EQU -1 (
    	echo A reboot is required. Please run this script again once the reboot is done.
    ) else (
        echo:
        echo Validating WSL configuration. Once you have chosen a username, please exit
        echo ==========================================================================
        echo:

        wsl --install

        echo:
        echo Updating Git and activating systemd
        echo ===================================
        echo:

        REM This is a one-liner in order to not have to input password multiple times
        wsl -- sudo apt update; sudo apt upgrade -y; sudo add-apt-repository ppa:git-core/ppa -y; sudo apt install git -y; sudo echo -e "[boot]\nsystemd=true" ^| sudo tee /etc/wsl.conf
        wsl --shutdown

        echo:
        echo WSL successfully installed and configured
        echo =========================================
        echo:
    )
)


winget install -e --id Python.Python.3.11
winget install --id Git.Git -e --source winget
winget install --id=Oracle.MySQL -e