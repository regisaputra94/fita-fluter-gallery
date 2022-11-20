*** Variables ***
${UDID}                     emulator-5554

${HOST}                     http://localhost:4723/wd/hub
${PLATFORM_NAME}            Android
${DEVICE_NAME}              Android
${APP_PACKAGE}              io.flutter.demo.gallery
${APP_ACTIVITY}             .MainActivity
${UDID}                     ${UDID}
${APP}                      ${CURDIR}/../app/flutter_gallery_Android.apk
${DEFAULT_TIMEOUT}          20
${LONG_TIMEOUT}             40
${DEFAULT_TEST_TIMEOUT}     4 minutes