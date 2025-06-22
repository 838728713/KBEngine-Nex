@echo off
setlocal enabledelayedexpansion

rem Step 1: ���ñ���
set SOLUTION_DIR=%~dp0
set BUILD_SCRIPT=%SOLUTION_DIR%lib\python\PCbuild\build.bat
set CONFIG=Debug

rem Step 2: ִ�й���
echo [1] ���ڹ��� Python������ build.bat -c %CONFIG% ...
call "%BUILD_SCRIPT%" -c %CONFIG%
if errorlevel 1 (
    echo [ERROR] ����ʧ�ܣ���ֹ�ű���
    pause
    exit /b 1
)

rem Step 3: �����ļ�·��
set OUT_DIR=%SOLUTION_DIR%lib\python\PCbuild\amd64
set python313_d_LIB_FILE=python313_d.lib
set python313_d_EXP_FILE=python313_d.exp

set python313_d_DLL_FILE=python313_d.dll
set python313_d_ILK_FILE=python313_d.ilk
set python313_d_PDB_FILE=python313_d.pdb

set vcruntime140_FILE=vcruntime140.dll
set vcruntime140_1_FILE=vcruntime140_1.dll

set TARGET_LIB_DIR=%~dp0libs
set TARGET_DLL_DIR=%~dp0..\bin\server

rem Step 4: ����Ŀ��Ŀ¼���粻���ڣ�
if not exist "%TARGET_LIB_DIR%" (
    mkdir "%TARGET_LIB_DIR%"
)
if not exist "%TARGET_DLL_DIR%" (
    mkdir "%TARGET_DLL_DIR%"
)

rem Step 5: ���� lib �ļ�
echo [2] ���ڸ��� %python313_d_LIB_FILE% �� %TARGET_LIB_DIR%
copy /Y "%OUT_DIR%\%python313_d_LIB_FILE%" "%TARGET_LIB_DIR%"
if errorlevel 1 (
    echo [ERROR] ���� %python313_d_LIB_FILE% �ļ�ʧ�ܡ�
    pause
    exit /b 1
)
echo [2] ���ڸ��� %python313_d_EXP_FILE% �� %TARGET_LIB_DIR%
copy /Y "%OUT_DIR%\%python313_d_EXP_FILE%" "%TARGET_LIB_DIR%"
if errorlevel 1 (
    echo [ERROR] ���� %python313_d_EXP_FILE% �ļ�ʧ�ܡ�
    pause
    exit /b 1
)

rem Step 6: ���� dll �ļ�
echo [3] ���ڸ��� %python313_d_DLL_FILE% �� %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%python313_d_DLL_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] ���� %python313_d_LIB_FILE% �ļ�ʧ�ܡ�
    pause
    exit /b 1
)

echo [4] ���ڸ��� %python313_d_ILK_FILE% �� %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%python313_d_ILK_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] ���� %python313_d_ILK_FILE% �ļ�ʧ�ܡ�
    pause
    exit /b 1
)

echo [5] ���ڸ��� %python313_d_PDB_FILE% �� %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%python313_d_PDB_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] ���� %python313_d_PDB_FILE% �ļ�ʧ�ܡ�
    pause
    exit /b 1
)


echo [6] ���ڸ��� %vcruntime140_FILE% �� %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%vcruntime140_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] ���� %vcruntime140_FILE% �ļ�ʧ�ܡ�
    pause
    exit /b 1
)


echo [7] ���ڸ��� %vcruntime140_1_FILE% �� %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%vcruntime140_1_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] ���� %vcruntime140_1_FILE% �ļ�ʧ�ܡ�
    pause
    exit /b 1
)


set LIBS_DIR=%SOLUTION_DIR%lib\python\Lib
set OUT_LIBS_DIR=%~dp0..\res\scripts\common\Lib
set OUT_DLLS_DIR=%~dp0..\res\scripts\common\DLLs

echo [7] ���ڸ��� %LIBS_DIR% �� %OUT_LIBS_DIR%

xcopy %LIBS_DIR% %OUT_LIBS_DIR% /Y /i /e



echo [8] ���ڸ��� %OUT_DIR% �� %OUT_DLLS_DIR%

xcopy %OUT_DIR% %OUT_DLLS_DIR% /Y /i /e

echo ������� 

pause
