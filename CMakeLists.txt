cmake_minimum_required(VERSION 3.18)

project(CardashApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Gui Qml Quick)
find_package(Qt6 6.2 COMPONENTS SerialBus REQUIRED)

qt_add_executable(CardashApp src/main.cpp
                                src/can.h
                                src/can.cpp
                            )

qt_add_resources(CardashApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_link_libraries(CardashApp PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
    Qt${QT_VERSION_MAJOR}::SerialBus
)

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
#find_package (Qt5
#    REQUIRED COMPONENTS Quick
#                                        Sql
#                                        XmlPatterns
#                                        Xml
##                                        SerialBus
#                                    )

