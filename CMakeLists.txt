cmake_minimum_required(VERSION 3.16)

project(UltraSound VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)


find_package(Qt6 6.2 COMPONENTS Quick Sql REQUIRED)

qt_add_executable(appUltraSound
    main.cpp
)

qt_add_qml_module(appUltraSound
    URI UltraSound
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES
    SOURCES
    SOURCES
    SOURCES
    QML_FILES signup.qml
    QML_FILES login.qml
    QML_FILES contact.qml
    SOURCES database_manager.h database_manager.cpp
    QML_FILES
    QML_FILES employee_op.qml
    QML_FILES emp_exp.qml
    QML_FILES emp_total.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appUltraSound PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appUltraSound
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appUltraSound
    PRIVATE Qt6::Quick Qt6::Sql)

include(GNUInstallDirs)
install(TARGETS appUltraSound
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
