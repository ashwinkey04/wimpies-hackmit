# Kaigi - HackMIT

## Introduction
Cross platform application that can help people make friends online and host events.

Tested on Android only.

## Technologies & Architecture
Flutter, Dart, Google Maps Places SDK

#### Firebase 
* Authentication
* Firestore
* Storage

#### Architecture components
* Provider

## Features



## Setup
Create a `.env` file in the root directory of the project and add your Maps Places API key in the below format.

```
PLACES_KEY = "AIzaSyBDHGmP-****************wARZ1s"
```


#### Requirements
* Basic knowledge about Flutter
* Basic knowledge about Android
* Basic knowledge about Firebase
* Flutter SDK version >= 2.0.0 (tested and works with 2.0.0)

#### Firebase
* Setup Authentication and use the Sign-in method 'Email/Password'
* Setup Firestore
* Setup Storage
* Replace the file [google-services.json](android/app/google-services.json)

#### Project
1. Download and open the project in e.g Android Studio
2. Connect your Android phone or use the emulator to start the application
