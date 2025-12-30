@echo off
setlocal

taskkill /IM RainbowSix.exe /F /T >nul 2>&1
taskkill /IM RainbowSix_DX11.exe /F /T >nul 2>&1
taskkill /IM RainbowSix_DX12.exe /F /T >nul 2>&1
taskkill /IM RainbowSix_Vulkan.exe /F /T >nul 2>&1
taskkill /IM RainbowSixGame.exe /F /T >nul 2>&1

for %%F in (
    "RainbowSixGame.exe"
    "RainbowSix_DX11.exe"
    "RainbowSix.exe"
    "RainbowSix_Vulkan.exe"
) do (
    if exist %%F (
        echo %%~F launching...
        
        start "" %%F /belaunch /nologo
        goto :wait_and_kill
    )
)

echo.
echo ERROR: Could not find any R6 executable in this folder.
echo Press any key to exit...
pause > nul
goto :eof

:wait_and_kill
echo Press any key to forcefully close R6...
pause >nul
echo Closing R6...

taskkill /IM RainbowSix.exe /F /T >nul 2>&1
taskkill /IM RainbowSix_DX11.exe /F /T >nul 2>&1
taskkill /IM RainbowSix_DX12.exe /F /T >nul 2>&1
taskkill /IM RainbowSix_Vulkan.exe /F /T >nul 2>&1
taskkill /IM RainbowSixGame.exe /F /T >nul 2>&1

echo Exiting...