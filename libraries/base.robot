*** Settings ***
Resource                ../libraries/routers.robot

*** Keywords ***
User Has Opened Flutter Gallery Application
    [Documentation]     Keyword for open flutter gallery application
    Open Application	${HOST}
    ...                 platformName=${PLATFORM_NAME}
    ...                 deviceName=${DEVICE_NAME}
    ...                 appPackage=${APP_PACKAGE}
    ...                 appActivity=${APP_ACTIVITY}
    ...                 udid=${UDID}
    ...                 app=${APP}