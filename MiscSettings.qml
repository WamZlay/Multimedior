import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    SystemPalette { id: sysPalette; colorGroup: SystemPalette.Active }

    Label {
        id: label_title
        x: 77
        y: 8
        text: "Miscellaneous"
        opacity: 1
    }

    Item {
        id: speed_settings
        x: 8
        y: 30
        width: 212
        height: 22
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0

        Label {
            id: label_SPEED
            text: "Speed:"
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            id: label_currentspeed
            x: 187
            text: "0.00"
            anchors.verticalCenter: parent.verticalCenter
        }

        Slider {
            id: slider_speed
            x: 45
            width: 136
            activeFocusOnPress: true
            minimumValue: 0.1
            value: 1
            maximumValue: 2
            anchors.verticalCenter: parent.verticalCenter

            onValueChanged: {
                label_currentspeed.text = value.toFixed(2)
                management.setSpeed(value)
            }
        }
    }

    Item {
        id: size_settings
        y: -99
        height: 22
        visible: false
        anchors.topMargin: 6
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: count_settings.bottom
        Label {
            id: label_SIZE
            text: "Size:"
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            id: label_currentsize
            x: 187
            text: "10"
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }

        Slider {
            id: slider_size
            x: 45
            width: 136
            activeFocusOnPress: true
            tickmarksEnabled: true
            updateValueWhileDragging: true
            stepSize: 1
            minimumValue: 5
            anchors.verticalCenter: parent.verticalCenter
            maximumValue: 15
            value: 10

            onValueChanged: {
                management.setSize(value)
                label_currentsize.text = value
            }
        }
        opacity: 0
    }

    ColorPicker {
        id: colorPicker1
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0
    }

        id: rectangle1
        width: 228
        height: 32
        color: sysPalette.window
        radius: 1
        border.color: sysPalette.mid

        states: [
            State {
                name: "VISIBLE"

                PropertyChanges {
                    target: rectangle1
                    height: 335
                }

                PropertyChanges {
                    target: label_title
                    x: 8
                    y: 8
                    text: "Miscellaneous:"
                    anchors.verticalCenterOffset: -97
                    anchors.horizontalCenterOffset: -67
                }

                PropertyChanges {
                    target: speed_settings
                    visible: true
                    anchors.topMargin: 6
                    opacity: 1
                }

                PropertyChanges {
                    target: slider_speed
                    anchors.verticalCenterOffset: 0
                }

                PropertyChanges {
                    target: label_currentspeed
                    anchors.verticalCenterOffset: 0
                }

                PropertyChanges {
                    target: size_settings
                    y: 58
                    height: 22
                    visible: true
                    anchors.rightMargin: 8
                    anchors.leftMargin: 8
                    opacity: 1
                }

                PropertyChanges {
                    target: colorPicker1
                    x: 18
                    y: 100
                    opacity: 1
                }
            }
        ]

        transitions: [
            Transition {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    properties: {"x, y, topMargin, opacity, height"}
                }
            }
        ]
    }
