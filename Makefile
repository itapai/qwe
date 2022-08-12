.PHONY: web ci-web windows ci-windows

ci-web: web dist-web

dist-web:
	mkdir -p build/dist
	cp build/web/friendly-fire-web-$(version).zip build/dist

web:
	cd build/web && zip -r friendly-fire-web-$(version).zip .

ci-windows: windows dist-windows

dist-windows:
	powershell 'mkdir build/dist -Force | Out-Null'
	powershell 'copy build/windows/wix/installer.msi build/dist/friendly-fire-desktop-$(version).windows-amd64.msi'

windows:
    # powershell echo 'C:\Program Files (x86)\WiX Toolset v3.11\bin" | Out-File -FilePath $$env:GITHUB_PATH -Encoding utf8 -Append'
	heat.exe dir build/windows/runner/Release -nologo -dr INSTALLDIR -cg AppComponents -gg -ke -sfrag -sreg -srd -o scripts/ci-msi-builder/App.wxs
	candle.exe -nologo -arch x64 -dBuildVersion=$(subst v,,$(version)) -ext WixUIExtension -ext WixUtilExtension -out build/windows/wix/ scripts/ci-msi-builder/*.wxs
	light.exe -sice:ICE60 -nologo -b build/windows/runner/Release -ext WixUIExtension -ext WixUtilExtension -out build/windows/wix/installer.msi build/windows/wix/*.wixobj

install:
	msiexec.exe /i build\windows\wix\installer.msi /qn /l build/windows/wix/install.log

uninstall:
	msiexec.exe /x build\windows\wix\installer.msi /qn /l build/windows/wix/uninstall.log
