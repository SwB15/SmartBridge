# SmartBridge:

SmartBridge is a dual Flutter application project designed to enable seamless and continuous communication between an Android smartphone and an Android Smartwatch using bluetooth

This repository contains two apps:

- "phone_app" : Flutter app for smartphones
- "watch_app" : Flutter app for smartwatches

# Features:

- Persistent Bluetooth connection between phone and watch
- Automatically connect without intergering with normal Android behavior
- Allow data exchange between the devices
- Each app can function independently if needed

# Project Structure:

bridge/
├── phone_app/ # Flutter app for the phone
└── watch_app/ # Flutter app for the smartwatch

# How It Works:

- The phone scans for nearby Bluetooth devices.
- Once the watch is found and selected, the connection is established.
- Data can be sent and received in real time between both devices.

# Requirements:

- Flutter SDK
- Android Studio
- Android device with Bluetooth support (phone and watch)
- Minimum SDK: 21 (Android 5.0)

# Installation:

```bash
git clone https://github.com/SwB15/SmartBridge.git
cd SmartBridge/bridge
