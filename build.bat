@echo off
echo Building File Share App...

echo.
echo Step 1: Getting dependencies...
flutter pub get

echo.
echo Step 2: Analyzing code...
flutter analyze --no-fatal-infos

echo.
echo Step 3: Running tests...
flutter test

echo.
echo Step 4: Building APK...
flutter build apk --release

echo.
echo Build completed!
echo APK location: build\app\outputs\flutter-apk\app-release.apk

pause