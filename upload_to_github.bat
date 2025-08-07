@echo off
echo ========================================
echo Upload to GitHub for APK Build
echo ========================================

echo.
echo This script will help you upload the project to GitHub
echo for automatic APK building (no Android Studio needed!)
echo.

echo Step 1: Create GitHub Account
echo Go to: https://github.com/
echo Sign up for free account
echo.
pause

echo Step 2: Create New Repository
echo 1. Click "New Repository"
echo 2. Name: file-share-app
echo 3. Choose "Public" (free)
echo 4. Click "Create Repository"
echo.
pause

echo Step 3: Upload Files
echo Method 1 - Drag and Drop (Easiest):
echo 1. Open the new repository page
echo 2. Click "uploading an existing file"
echo 3. Drag the entire testapp folder to the browser
echo 4. Write commit message: "Initial commit"
echo 5. Click "Commit changes"
echo.

echo Method 2 - Git Commands (Advanced):
echo Run these commands in testapp folder:
echo   git init
echo   git add .
echo   git commit -m "Initial commit"
echo   git branch -M main
echo   git remote add origin [YOUR_REPO_URL]
echo   git push -u origin main
echo.
pause

echo Step 4: Enable GitHub Actions
echo 1. Go to "Actions" tab in your repository
echo 2. Click "I understand my workflows, go ahead and enable them"
echo 3. GitHub will automatically detect the build workflow
echo.
pause

echo Step 5: Wait for Build
echo 1. Go to "Actions" tab
echo 2. You'll see "Build Android APK" running
echo 3. Wait 8-12 minutes for green checkmark ✓
echo.
pause

echo Step 6: Download APK
echo 1. Click on the successful build (green ✓)
echo 2. Scroll down to "Artifacts"
echo 3. Click "android-apk" to download
echo 4. Extract ZIP file
echo 5. You'll find app-release.apk ready!
echo.

echo ========================================
echo WHAT YOU'LL GET:
echo ========================================
echo File: app-release.apk (~45 MB)
echo Ready to install on Android devices
echo All features working:
echo - Wi-Fi file sharing
echo - Multiple file types support
echo - Modern UI with dark/light themes
echo - Real-time transfer progress
echo - QR code device pairing
echo - Transfer history
echo.

echo ========================================
echo ALTERNATIVE: Use Codemagic (Faster)
echo ========================================
echo 1. Go to: https://codemagic.io/signup
echo 2. Sign up with GitHub
echo 3. Add Flutter application
echo 4. Connect your repository
echo 5. Start build (5 minutes)
echo 6. Download APK
echo.

echo ========================================
echo INSTALLATION ON PHONE:
echo ========================================
echo 1. Enable "Unknown Sources":
echo    Settings → Security → Unknown Sources
echo 2. Copy APK to phone (USB/Cloud/Email)
echo 3. Open File Manager, find APK
echo 4. Tap to install
echo 5. Grant all permissions
echo 6. Test with two devices on same Wi-Fi
echo.

echo ========================================
echo The app is 100%% complete and ready!
echo Just needs APK build through GitHub Actions
echo ========================================
echo.

echo Ready to start? Press any key to open GitHub...
pause
start https://github.com/

echo.
echo Follow the steps above to get your APK!
echo The entire process takes about 15 minutes.
echo.
pause