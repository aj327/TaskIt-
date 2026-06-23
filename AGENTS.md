# Task It!

A small iOS to-do app written in Swift (UIKit + Storyboards + Core Data). Created in 2017.

- UI: UIKit storyboards (`Task It!/Base.lproj/Main.storyboard`, `LaunchScreen.storyboard`) with `ViewController`, `CreateTaskViewController`, `CompleteTaskViewController`.
- Persistence: Core Data model `Task It!/Task_It_.xcdatamodeld` (single `Task` entity: `name`, `taskImportance`).
- App entry: `Task It!/AppDelegate.swift`.

## Cursor Cloud specific instructions

IMPORTANT PLATFORM LIMITATION: This is a native iOS app and **cannot be built or run on the Linux Cursor Cloud VM**. There is no possible dependency-install step that fixes this — it is a platform incompatibility, not a missing package.

Key facts (from `Task It!.xcodeproj/project.pbxproj`):
- `SDKROOT = iphoneos` (requires the Apple iOS SDK)
- `IPHONEOS_DEPLOYMENT_TARGET = 10.3`
- `SWIFT_VERSION = 3.0` (Swift 3 — only available in old Xcode 8/9 toolchains)
- Uses `UIKit`, `CoreData`, and Interface Builder storyboards.

Why it can't run here:
- Xcode (and `xcodebuild`/iOS Simulator) is macOS-only and cannot be installed on Linux.
- `UIKit`, Core Data's iOS stack, and storyboards are not available in the open-source Swift toolchain on Linux.
- There are no third-party dependencies to install: no `Podfile` (CocoaPods), no `Package.swift` (SwiftPM), no `Cartfile` (Carthage).

How to actually build/run/test (requires macOS + Xcode):
- Open `Task It!.xcodeproj` in Xcode.
- Select an iOS Simulator (e.g. iPhone) and Run (Cmd+R). Note: with `SWIFT_VERSION = 3.0`, a modern Xcode will prompt to migrate the Swift syntax first.
- There is no automated test target in the project.

Consequence for Cloud agents: lint/build/run/test of this app are not achievable on the Linux VM. Do not attempt to install Xcode or a Swift toolchain to "fix" the environment — it will not enable building this iOS project.
