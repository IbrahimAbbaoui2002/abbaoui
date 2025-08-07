@echo off
echo Starting File Share App in development mode...

echo.
echo Getting dependencies...
flutter pub get

echo.
echo Starting app...
flutter run --debug

pause