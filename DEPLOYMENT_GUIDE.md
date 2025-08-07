# File Share App - Deployment Guide

## 🚀 Pre-Deployment Setup

### Windows Development Environment
1. **Enable Developer Mode**
   ```
   Run: start ms-settings:developers
   Enable: Developer Mode
   ```

2. **Flutter Environment Check**
   ```bash
   flutter doctor
   flutter --version
   ```

### Required Tools
- Flutter SDK 3.0.0+
- Android Studio or VS Code
- Android SDK (API 21+)
- Physical Android devices for testing

## 📦 Build Process

### 1. Clean Build
```bash
cd testapp
flutter clean
flutter pub get
```

### 2. Development Build
```bash
flutter run --debug
```

### 3. Release Build
```bash
flutter build apk --release --no-tree-shake-icons
```

### 4. Build Output
- **Location**: `build/app/outputs/flutter-apk/app-release.apk`
- **Size**: ~30-50 MB (estimated)
- **Target**: Android API 21+ (Android 5.0+)

## 📱 Installation Guide

### For Testing Devices
1. **Enable Unknown Sources**
   - Settings → Security → Unknown Sources (Enable)
   - Or Settings → Apps → Special Access → Install Unknown Apps

2. **Install APK**
   - Transfer APK to device
   - Tap to install
   - Grant installation permission

3. **Grant Permissions**
   - Storage permissions
   - Location permissions
   - Wi-Fi permissions
   - Camera permission (for QR scanning)
   - Notification permission

## 🔧 Configuration

### Android Manifest Permissions
Already configured in `android/app/src/main/AndroidManifest.xml`:
- Internet and network access
- Wi-Fi state management
- Location services
- Storage access
- Bluetooth for nearby connections
- Camera for QR scanning
- Notifications

### App Configuration
Key settings in `lib/core/constants/app_constants.dart`:
- Default port: 8080
- Max file size: 2GB
- Chunk size: 64KB
- Discovery timeout: 30 seconds

## 🧪 Testing Checklist

### Pre-Release Testing
- [ ] Install on two physical Android devices
- [ ] Test file selection (all supported types)
- [ ] Test device discovery
- [ ] Test file transfer (small and large files)
- [ ] Test QR code pairing
- [ ] Test transfer history
- [ ] Test background transfers
- [ ] Test error scenarios
- [ ] Test permission handling

### Network Scenarios
- [ ] Same Wi-Fi network transfer
- [ ] Wi-Fi Direct transfer
- [ ] Network interruption handling
- [ ] Multiple device discovery
- [ ] Connection timeout handling

### File Type Testing
- [ ] Images: JPG, PNG, GIF
- [ ] Videos: MP4, AVI, MOV
- [ ] Audio: MP3, WAV, AAC
- [ ] Documents: PDF, DOC, TXT
- [ ] Archives: ZIP, RAR

## 📊 Performance Benchmarks

### Expected Performance
- **App Launch**: < 3 seconds
- **Device Discovery**: < 10 seconds
- **Connection Setup**: < 5 seconds
- **Transfer Speed**: 10-100 MB/s (network dependent)
- **Memory Usage**: 50-100 MB during transfers

### Optimization Settings
- Release build optimizations enabled
- Tree shaking disabled for icons
- Proguard/R8 optimization (default)

## 🔒 Security Considerations

### Data Protection
- All transfers are peer-to-peer
- No cloud storage or external servers
- Local encryption for data transmission
- Transfer history stored locally only

### Permission Security
- Minimal required permissions
- Runtime permission requests
- Clear permission explanations
- Graceful permission denial handling

## 🐛 Known Issues & Workarounds

### Common Issues
1. **Devices Not Found**
   - Ensure same Wi-Fi network
   - Check location permissions
   - Restart Wi-Fi on both devices

2. **Transfer Failures**
   - Check available storage
   - Verify file permissions
   - Try smaller files first

3. **Permission Denied**
   - Manually grant permissions in settings
   - Restart app after granting permissions

### Workarounds
- Use QR code pairing if discovery fails
- Split large files if transfer fails
- Clear app cache if issues persist

## 📈 Distribution Options

### Direct Distribution
- Share APK file directly
- Install via file manager
- No app store required

### Future App Store Distribution
- Google Play Store (requires developer account)
- Alternative app stores
- Enterprise distribution

## 🔄 Update Process

### Version Management
- Update version in `pubspec.yaml`
- Update version code in `android/app/build.gradle`
- Create release notes

### Update Distribution
- Build new APK
- Distribute to users
- Users install over existing app
- Data and settings preserved

## 📋 Deployment Checklist

### Pre-Deployment
- [ ] Code review completed
- [ ] All tests passing
- [ ] Performance benchmarks met
- [ ] Security review completed
- [ ] Documentation updated

### Build Process
- [ ] Clean build environment
- [ ] Dependencies updated
- [ ] Release build successful
- [ ] APK size acceptable
- [ ] No critical warnings

### Testing
- [ ] Installation testing
- [ ] Functionality testing
- [ ] Performance testing
- [ ] Security testing
- [ ] User acceptance testing

### Distribution
- [ ] APK signed (if required)
- [ ] Distribution method chosen
- [ ] Installation guide prepared
- [ ] Support documentation ready

## 🎯 Success Metrics

### Technical Metrics
- App launches successfully on target devices
- All core features functional
- Transfer speeds meet expectations
- No critical crashes or errors

### User Experience Metrics
- Intuitive user interface
- Quick device discovery
- Reliable file transfers
- Clear progress feedback

## 📞 Support Information

### For Developers
- Check project documentation
- Review code comments
- Use Flutter debugging tools
- Check device logs

### For Users
- Follow setup guide
- Check troubleshooting section
- Verify device compatibility
- Ensure proper permissions

---

**Note**: This app requires physical Android devices for full functionality testing. Emulators do not support Wi-Fi Direct features.