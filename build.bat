@echo off
if "%1" == "interp" (

echo Running interpreter config
echo.

start "" /D . /B /W haxe.exe interp_build.hxml %2 %3 %4 %5 %6

) else if "%1" == "java" (

echo Running Java config
echo Step 1: Compile
echo.

start "" /D . /B /W haxe.exe java_build.hxml

echo.
echo Step 2: Run Jar
echo.

start "" /D . /B /W java.exe -Xmx2G -jar bin\java\Main.jar %2 %3 %4 %5 %6

) else if "%1" == "cpp" (

echo Running c++ config
echo.

start "" /D . /B /W haxe.exe cpp_build.hxml %2 %3 %4 %5 %6

) else if "%1" == "all" (
echo [Interp]
call build.bat interp
echo [Java]
call build.bat java
echo [C++]
call build.bat cpp
) else (
echo Unknown mode! Choose between interp and java
)