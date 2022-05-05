!include "MUI.nsh"

!define MUI_ICON "..\icon\${INSTALLATIONNAME}.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "..\icon\${INSTALLATIONNAME}.bmp"
!define MUI_HEADERIMAGE_RIGHT

Name "PDFcrypt"
!define INSTALLATIONNAME "PDFcrypt"
;!define DISPLAYEDNAME "PDFcrypt"
;${DISPLAYEDNAME}
OutFile "..\bin\${INSTALLATIONNAME}-Installer.exe"
InstallDir "$PROGRAMFILES\${INSTALLATIONNAME}"
DirText "This will install ${INSTALLATIONNAME}."
ComponentText "Please choose the components to install."

!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Section "PDFcrypt" SectionGeneral
SectionIn RO
SetOutPath "$INSTDIR"
File "..\bin\${INSTALLATIONNAME}.exe"
SectionEnd

SectionGroup "Shortcuts"
Section /o "Desktop shortcut" SectionDeskShort
CreateShortCut "$DESKTOP\${INSTALLATIONNAME}.lnk" "$INSTDIR\${INSTALLATIONNAME}.exe"
SectionEnd

Section "Start Menu shortcut" SectionStartShort
CreateShortCut "$SMPROGRAMS\${INSTALLATIONNAME}.lnk" "$INSTDIR\${INSTALLATIONNAME}.exe"
SectionEnd
SectionGroupEnd

Section "Create Uninstaller" SectionCrUninst
WriteUninstaller "$INSTDIR\uninstall.exe"

WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLATIONNAME}" "DisplayName" "PDFcrypt"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLATIONNAME}" "UninstallString" '"$INSTDIR\uninstall.exe"'
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLATIONNAME}" "NoModify" 1
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLATIONNAME}" "NoRepair" 1
SectionEnd

Section "Uninstall"
DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLATIONNAME}"

Delete "$INSTDIR\uninstall.exe"
Delete "$INSTDIR\${INSTALLATIONNAME}.exe"
Delete "$SMPROGRAMS\${INSTALLATIONNAME}.lnk"
Delete "$DESKTOP\${INSTALLATIONNAME}.lnk"
RMDir "$INSTDIR"
SectionEnd

LangString DESC_SectionGeneral ${LANG_ENGLISH} "Program"
LangString DESC_SectionDeskShort ${LANG_ENGLISH} "Shortcut on Desktop"
LangString DESC_SectionStartShort ${LANG_ENGLISH} "Shortcut in Start Menu"
LangString DESC_SectionCrUninst ${LANG_ENGLISH} "Uninstaller with registry entries"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SectionGeneral} $(DESC_SectionGeneral)
!insertmacro MUI_DESCRIPTION_TEXT ${SectionDeskShort} $(DESC_SectionDeskShort)
!insertmacro MUI_DESCRIPTION_TEXT ${SectionStartShort} $(DESC_SectionStartShort)
!insertmacro MUI_DESCRIPTION_TEXT ${SectionCrUninst} $(DESC_SectionCrUninst)
!insertmacro MUI_FUNCTION_DESCRIPTION_END