# fita-fluter-gallery

Setup
1. Install Python 3.*
2. Install Robot Framework
3. Install AppiumLibrary
4. Change the value of variable ${UDID} at fita-flutter-gallery/libraries/config.robot to udid of device
5. Download apk here -> https://github.com/flutter/gallery/releases/download/v2.9.2/flutter_gallery_Android.apk
6. Create folder `app` in folder fita-flutter-gallery and put the apk in this folder

How To Run
1. Run setup above
2. Clone this repo to local
3. cd fita-flutter-gallery
2. robot -d reports testCase\AddToCart.robot



* Notes
I try for filtering by Menu Clothing but it doesn't work because the element locator of item not found if filter activated.
