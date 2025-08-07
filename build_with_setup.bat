@echo off
setlocal enabledelayedexpansion

echo ========================================
echo File Share App - Build with Setup Check
echo ========================================

echo.
echo Checking Flutter and Android SDK setup...

:: Check Flutter
flutter --version >nul 2>&1
if !errorlevel! neq 0 (
    echo ERROR: Flutter is not installed or not in PATH
    echo Please install Flutter from: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)
echo ✓ Flutter is installed

:: Check Android SDK
flutter doctor --android-licenses >nul 2>&1
if !errorlevel! neq 0 (
    echo.
    echo WARNING: Android SDK not properly configured
    echo.
    echo Please follow these steps:
    echo 1. Install Android Studio from: https://developer.android.com/studio
    echo 2. Open Android Studio and complete initial setup
    echo 3. Run: flutter doctor
    echo 4. Run: flutter doctor --android-licenses
    echo.
    echo Or check ANDROID_SETUP.md for detailed instructions
    echo.
    pause
    
    echo Attempting to continue anyway...
    echo.
)

:: Run Flutter Doctor
echo Running Flutter Doctor...
flutter doctor

echo.
echo ========================================
echo Attempting to build APK...
echo ========================================

:: Clean and get dependencies
echo Step 1: Cleaning project...
flutter clean

echo Step 2: Getting dependencies...
flutter pub get

:: Try to build APK
echo Step 3: Building APK...
flutter build apk --release --no-tree-shake-icons

if !errorlevel! equ 0 (
    echo.
    echo ========================================
    echo BUILD SUCCESSFUL!
    echo ========================================
    
    set "apk_path=build\app\outputs\flutter-apk\app-release.apk"
    if exist "!apk_path!" (
        echo.
        echo APK Location: !apk_path!
        for %%I in ("!apk_path!") do (
            set "size=%%~zI"
            set /a "size_mb=!size! / 1048576"
            echo APK Size: !size! bytes (~!size_mb! MB)
        )
        
        echo.
        echo ========================================
        echo Installation Instructions:
        echo ========================================
        echo 1. Copy app-release.apk to your Android device
        echo 2. Enable "Install from unknown sources"
        echo 3. Install the APK
        echo 4. Grant all permissions when prompted
        echo 5. Test with another device on same Wi-Fi
        
        echo.
        echo ========================================
        echo Additional Build Options:
        echo ========================================
        echo To build AAB for Play Store:
        echo   flutter build appbundle --release
        echo.
        echo To build split APKs:
        echo   flutter build apk --split-per-abi --release
        
    ) else (
        echo ERROR: APK file not found at expected location
    )
    
) else (
    echo.
    echo ========================================
    echo BUILD FAILED!
    echo ========================================
    echo.
    echo Common solutions:
    echo 1. Install Android Studio: https://developer.android.com/studio
    echo 2. Run: flutter doctor
    echo 3. Run: flutter doctor --android-licenses
    echo 4. Check ANDROID_SETUP.md for detailed instructions
    echo.
    echo If you have Android Studio installed:
    echo 1. Open Android Studio
    echo 2. Go to Tools → SDK Manager
    echo 3. Install Android SDK Platform-Tools
    echo 4. Install Android SDK Build-Tools
    echo 5. Set ANDROID_HOME environment variable
    echo.
)

echo.
pause