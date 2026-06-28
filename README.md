# Photo Frame Widget

<!-- THOX-BADGES:START -->
[![Repository](https://img.shields.io/badge/repository-ttracx/photo--frame--widget--ios-0B1220)](https://github.com/ttracx/photo-frame-widget-ios)
![THOX.ai LLC](https://img.shields.io/badge/owner-THOX.ai%20LLC-00A676)
![Visibility](https://img.shields.io/badge/visibility-public-00A676)
![Leadership](https://img.shields.io/badge/CTO-Tommy%20Xaypanya-1F6FEB)
![Leadership](https://img.shields.io/badge/CEO-Craig%20Ross-6F42C1)
<!-- THOX-BADGES:END -->


A simple iOS widget app that lets users display their favorite photos on their Home Screen.

## 📱 App Overview

- **Name**: Photo Frame
- **Category**: Utilities
- **Price**: Free with $0.99 Pro upgrade
- **Target**: iOS 17.0+

## 💰 Revenue Model

- Free version: Display single photo widget
- Pro upgrade ($0.99): Multiple widgets, auto-rotate, filters, more sizes

**To make 99¢/month**: You need just 1-2 Pro sales per month, or ~20-30 free users who convert at 5-10% rate.

## 🚀 Quick Start

### 1. Open in Xcode
```bash
open PhotoFrameWidget.xcodeproj
```

### 2. Configure Signing
1. Select project in navigator
2. Select "PhotoFrameWidget" target
3. Go to Signing & Capabilities
4. Select your Team
5. Change Bundle ID to something unique (e.g., `com.yourname.photoframe`)

### 3. Configure App Groups
1. In both targets (app and widget), enable App Groups capability
2. Create group: `group.com.yourname.photoframe` (must match bundle ID pattern)
3. Update code references to match your group ID

### 4. Configure In-App Purchase
1. Go to App Store Connect → Your App → Features → In-App Purchases
2. Create new IAP:
   - Type: Non-consumable
   - Product ID: `com.yourname.photoframe.pro`
   - Price: Tier 1 ($0.99)
   - Name: "Photo Frame Pro"
   - Description: "Unlock multiple widgets, auto-rotate, and filters"
3. Add screenshot and submit for review

### 5. Create App Icon
- Size: 1024x1024 PNG
- Use simple design with frame/photo motif
- No transparency
- Place in `Assets.xcassets/AppIcon.appiconset/`

### 6. Build & Test
1. Select target device/simulator
2. Cmd+R to run
3. Test photo selection and widget

## 📤 App Store Submission Checklist

### Required Assets
- [ ] App Icon (1024x1024)
- [ ] Screenshots (iPhone 6.7", 6.5", 5.5", iPad if universal)
- [ ] App Preview video (optional but recommended)
- [ ] Privacy Policy URL
- [ ] Support URL
- [ ] Marketing URL (optional)

### Screenshots Needed
- iPhone 14 Pro Max (1290x2796) - 3-5 screenshots
- iPhone 8 Plus (1242x2208) - 3-5 screenshots
- iPad Pro 12.9" (2048x2732) - if iPad supported

### Metadata
```
App Name: Photo Frame - Home Screen Widget
Subtitle: Display your favorite photos
Category: Utilities
Keywords: widget, photo, picture, frame, home screen, display, gallery

Description:
Photo Frame lets you display your favorite photos right on your Home Screen with beautiful widgets.

Features:
• Display any photo from your library
• Small, medium, and large widget sizes
• Easy setup - just tap and select
• Updates automatically

Upgrade to Pro to unlock:
• Multiple photo widgets
• Auto-rotate photos hourly
• Beautiful photo filters
• More customization options

Perfect for:
• Family photos
• Pet pictures
• Vacation memories
• Inspirational quotes
• Artwork displays

Download Photo Frame today and personalize your Home Screen!

What's New (1.0):
Initial release with photo widget support and Pro upgrade.
```

## 🎯 Marketing Tips for 99¢/Month

### Free Marketing
1. **Reddit**: Post in r/iOSWidgets, r/apple, r/iOSsetups
2. **TikTok**: Show widget setup process (30-60 sec videos)
3. **Twitter/X**: Share widget designs, before/after home screens
4. **Product Hunt**: Launch on PH for visibility

### Keywords for ASO
- photo widget
- picture frame widget
- home screen widget
- iOS widget
- custom widget
- photo display

### Conversion Optimization
- Make free version genuinely useful (one widget works great)
- Show Pro features clearly in UI
- Price at $0.99 (impulse buy territory)
- Add "Restore Purchases" button

## 🔒 Privacy

This app:
- Only accesses photos user explicitly selects
- Stores photos locally in app group (shared with widget)
- No server/data collection
- No analytics/tracking

See PRIVACY.md for full policy.

## 📝 License

This is starter code for your own App Store app. Modify and publish as your own.

## 🆘 Support

For issues:
1. Check bundle IDs match everywhere
2. Verify App Groups capability is enabled
3. Test on real device (widgets don't work fully in simulator)
4. Ensure IAP is approved in App Store Connect before testing purchases

<!-- THOX-DOCS-STANDARD:START -->
## Repository Description

THOX.ai LLC repository for photo frame widget ios, including project documentation, release readiness, and legal baseline.

## Documentation

- [Repository documentation](docs/README.md)
- [Security policy](SECURITY.md)
- [Contributing guide](CONTRIBUTING.md)
- [Legal notice](NOTICE.md)

## THOX.ai LLC

This repository is maintained by THOX.ai LLC.

- Tommy Xaypanya is CTO.
- Craig Ross is CEO.

## Copyright and Legal

Copyright (c) 2026 THOX.ai LLC. All rights reserved unless this repository includes a separate license file that states otherwise.

THOX-specific documentation, configuration, branding, product definitions, and integration work are owned by THOX.ai LLC unless explicitly noted. Third-party dependencies, forks, vendored components, and upstream source materials remain governed by their original licenses and notices.
<!-- THOX-DOCS-STANDARD:END -->
