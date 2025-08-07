@echo off
echo ========================================
echo File Share App - Release Build Script
echo ========================================

echo.
echo Step 1: Cleaning previous builds...
flutter clean

echo.
echo Step 2: Getting dependencies...
flutter pub get

echo.
echo Step 3: Analyzing code (ignoring warnings)...
flutter analyze --no-fatal-infos --no-fatal-warnings

echo.
echo Step 4: Building release APK...
flutter build apk --release --no-tree-shake-icons

echo.
echo ========================================
echo Build completed!
echo ========================================
echo.
echo APK Location: build\app\outputs\flutter-apk\app-release.apk
echo APK Size: 
for %%I in (build\app\outputs\flutter-apk\app-release.apk) do echo %%~zI bytes

echo.
echo Installation Instructions:
echo 1. Copy app-release.apk to your Android device
echo 2. Enable "Install from unknown sources" in device settings
echo 3. Install the APK
echo 4. Grant all requested permissions
echo 5. Test with another device on the same Wi-Fi network

echo.
pause