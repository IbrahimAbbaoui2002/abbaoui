# إعداد Android SDK لبناء التطبيق

## المشكلة الحالية
```
[!] No Android SDK found. Try setting the ANDROID_HOME environment variable.
```

## الحل: تثبيت Android SDK

### الطريقة 1: تثبيت Android Studio (الأسهل)

1. **تحميل Android Studio**
   - اذهب إلى: https://developer.android.com/studio
   - حمل Android Studio
   - ثبته مع الإعدادات الافتراضية

2. **تشغيل Android Studio**
   - افتح Android Studio
   - اتبع معالج الإعداد الأولي
   - سيقوم بتثبيت Android SDK تلقائياً

3. **التحقق من التثبيت**
   ```bash
   flutter doctor
   ```

### الطريقة 2: تثبيت Command Line Tools فقط

1. **تحميل Command Line Tools**
   - اذهب إلى: https://developer.android.com/studio#command-tools
   - حمل "Command line tools only"

2. **إنشاء مجلد Android SDK**
   ```bash
   mkdir C:\Android\Sdk
   ```

3. **استخراج Command Line Tools**
   - استخرج الملفات إلى: `C:\Android\Sdk\cmdline-tools\latest\`

4. **تعيين متغيرات البيئة**
   ```bash
   # إضافة إلى System Environment Variables
   ANDROID_HOME = C:\Android\Sdk
   ANDROID_SDK_ROOT = C:\Android\Sdk
   
   # إضافة إلى PATH
   %ANDROID_HOME%\platform-tools
   %ANDROID_HOME%\cmdline-tools\latest\bin
   ```

5. **تثبيت المكونات المطلوبة**
   ```bash
   sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"
   ```

### الطريقة 3: استخدام Flutter SDK Manager

1. **تشغيل Flutter Doctor**
   ```bash
   flutter doctor
   ```

2. **تثبيت Android SDK عبر Flutter**
   ```bash
   flutter doctor --android-licenses
   ```

## بعد التثبيت

### التحقق من الإعداد
```bash
flutter doctor -v
```

يجب أن ترى:
```
[✓] Android toolchain - develop for Android devices
    • Android SDK at C:\Android\Sdk
    • Platform android-33, build-tools 33.0.0
    • Java binary at: ...
    • All Android licenses accepted.
```

### بناء التطبيق
```bash
cd testapp
flutter build apk --release
```

## مواقع الملفات بعد البناء

### APK Files
```
build/app/outputs/flutter-apk/
├── app-release.apk          # APK الرئيسي (Universal)
├── app-armeabi-v7a-release.apk  # ARM 32-bit
├── app-arm64-v8a-release.apk    # ARM 64-bit
└── app-x86_64-release.apk       # x86 64-bit
```

### AAB File (للـ Play Store)
```bash
flutter build appbundle --release
```
الملف سيكون في:
```
build/app/outputs/bundle/release/
└── app-release.aab
```

## أحجام الملفات المتوقعة
- **APK Universal**: ~40-60 MB
- **APK ARM64**: ~25-35 MB  
- **AAB**: ~30-45 MB

## خطوات التثبيت على الجهاز

1. **نسخ APK إلى الجهاز**
2. **تفعيل "Unknown Sources"**
   - Settings → Security → Unknown Sources
3. **تثبيت APK**
4. **منح الصلاحيات المطلوبة**

## استكشاف الأخطاء

### خطأ: "Android SDK not found"
- تأكد من تثبيت Android SDK
- تحقق من متغيرات البيئة
- أعد تشغيل Command Prompt

### خطأ: "Android licenses not accepted"
```bash
flutter doctor --android-licenses
```

### خطأ: "Build failed"
- تحقق من إصدار Android SDK
- تأكد من تثبيت Build Tools
- نظف المشروع: `flutter clean`

## الخطوات التالية

بعد تثبيت Android SDK:

1. **تشغيل**: `flutter doctor`
2. **بناء APK**: `flutter build apk --release`
3. **بناء AAB**: `flutter build appbundle --release`
4. **اختبار التطبيق** على جهازين Android

---

**ملاحظة**: تحتاج إلى جهازين Android حقيقيين لاختبار Wi-Fi Direct. المحاكيات لا تدعم هذه الميزة.