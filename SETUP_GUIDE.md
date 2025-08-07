# File Share App - Setup Guide

## Quick Start

### Prerequisites
- Flutter SDK 3.0.0 or higher
- Android Studio or VS Code
- Two Android devices for testing (API level 21+)
- Physical devices (emulators don't support Wi-Fi Direct)

### Installation Steps

1. **Clone and Setup**
   ```bash
   cd testapp
   flutter pub get
   ```

2. **Build and Install**
   ```bash
   # For debug build
   flutter run
   
   # For release APK
   flutter build apk --release
   ```

3. **Install on Devices**
   - Install the APK on both test devices
   - Grant all requested permissions
   - Ensure both devices are on the same Wi-Fi network

### Testing the App

1. **Basic File Transfer Test**
   - Open app on both devices
   - Device A: Add files using "+" button
   - Device A: Go to "Devices" tab
   - Device B: Should appear in Device A's list
   - Device A: Select files and tap "Send Files"
   - Device A: Choose Device B from the list
   - Monitor transfer progress

2. **QR Code Connection Test**
   - Device A: Go to Settings → Share Connection
   - Device A: Show QR code
   - Device B: Go to Devices → Scan QR
   - Device B: Scan Device A's QR code
   - Devices should connect automatically

### Troubleshooting

#### Devices Not Found
- Ensure both devices are on same Wi-Fi network
- Check location permissions are granted
- Try refreshing device discovery
- Restart Wi-Fi on both devices

#### Transfer Failed
- Check available storage space
- Verify file permissions
- Try smaller files first
- Check Wi-Fi connection stability

#### Permissions Issues
- Go to device Settings → Apps → File Share
- Grant all permissions manually
- Restart the app

### App Features

#### File Types Supported
- **Images**: JPG, PNG, GIF, BMP, WEBP
- **Videos**: MP4, AVI, MOV, MKV, 3GP, WEBM
- **Audio**: MP3, WAV, AAC, OGG, M4A, FLAC
- **Documents**: PDF, DOC, DOCX, TXT, RTF, ODT
- **Archives**: ZIP, RAR, 7Z, TAR, GZ

#### Connection Methods
- **Wi-Fi Direct**: Direct device-to-device connection
- **Local Network**: Discovery via same Wi-Fi network
- **QR Code**: Quick pairing using QR codes

#### Transfer Features
- Multiple file selection
- Real-time progress tracking
- Transfer speed monitoring
- Background transfers
- Transfer history
- Resume interrupted transfers

### Development Notes

#### Architecture
- **State Management**: BLoC pattern
- **Networking**: Socket.IO + Nearby Connections
- **File Operations**: File picker + Path provider
- **UI**: Material 3 design system

#### Key Services
- `WifiService`: Device discovery and connection
- `FileService`: File operations and management
- `TransferService`: File transfer orchestration

#### Project Structure
```
lib/
├── core/                 # Core services and utilities
├── features/            # Feature modules
│   ├── device_discovery/
│   ├── file_sharing/
│   └── transfer_history/
├── shared/              # Shared models and widgets
└── main.dart           # App entry point
```

### Performance Tips

#### For Better Transfer Speed
- Use 5GHz Wi-Fi networks when available
- Keep devices close together
- Close other network-intensive apps
- Use Wi-Fi Direct for fastest speeds

#### For Better Battery Life
- Enable battery optimization exceptions
- Use power-saving mode during long transfers
- Keep devices plugged in for large transfers

### Security Notes

- Files are transferred directly between devices
- No data is stored on external servers
- Local network encryption is used
- Transfer history is stored locally only

### Known Limitations

- iOS support not yet implemented
- Maximum file size: 2GB per file
- Requires Android 5.0 (API 21) or higher
- Wi-Fi Direct may not work on all devices

### Support

For issues and questions:
1. Check this troubleshooting guide
2. Review the main README.md
3. Check device compatibility
4. Ensure proper permissions are granted

### Version History

- **v1.0.0**: Initial release
  - Basic file transfer functionality
  - Wi-Fi Direct and local network support
  - QR code pairing
  - Transfer history
  - Material 3 UI