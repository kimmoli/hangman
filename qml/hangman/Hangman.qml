import QtQuick 2.1
import Sailfish.Silica 1.0


Rectangle {
    id: hangman
    color: "transparent"

    property color contentColor: Theme.highlightColor
    property int errorCount: applicationData.errorCount
    property bool gameOver: false
    property bool success: false

    Rectangle {
        id: pole
        anchors.top: parent.top
        anchors.topMargin: parent.height / 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 50
        anchors.left: parent.left
        anchors.leftMargin: parent.height / 50
        width: parent.width / 20

        opacity: errorCount > 0 ? 1.0 : 0.0
        visible: opacity > 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 300
            }
        }

        color: contentColor
    }

    Rectangle {
        id: horizontalPole
        anchors.top: pole.top
        anchors.left: pole.right
        anchors.right: parent.right
        anchors.rightMargin: parent.height / 50
        height: parent.height / 20

        color: contentColor

        opacity: errorCount > 1 ? 1.0 : 0.0
        visible: opacity > 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 300
            }
        }
    }

    Rectangle {
        id: rope
        anchors.top: horizontalPole.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 50
        height: parent.height / 5

        opacity: errorCount > 2 ? 1.0 : 0.0
        visible: opacity > 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 300
            }
        }
        color: contentColor
    }

    Item {
        id: dude
        anchors.top: rope.bottom
        anchors.horizontalCenter: rope.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 10

        Rectangle {
            id: head
            anchors.top: parent.top
            anchors.topMargin: -1
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * 0.146
            width: height

            radius: width * 0.5
            color: "transparent"
            border.width: width / 5
            border.color: contentColor
            opacity: errorCount > 3 ? 1.0 : 0.0
            visible: opacity > 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }

        Rectangle {
            id: body
            anchors.top: head.bottom
            anchors.topMargin: -1
            anchors.horizontalCenter: head.horizontalCenter
            height: head.height * 3
            width: head.border.width
            color: contentColor
            opacity: errorCount > 4 ? 1.0 : 0.0
            visible: opacity > 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }

        Rectangle {
            id: arm1
            anchors.top: body.top
            anchors.topMargin: head.height * 0.25
            anchors.horizontalCenter: body.horizontalCenter
            height: body.height
            width: head.border.width
            transform: Rotation {
                origin.x: arm1.width / 2
                origin.y: 0
                angle: 30
            }
            color: contentColor
            antialiasing: true
            opacity: errorCount > 5 ? 1.0 : 0.0
            visible: opacity > 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }

        Rectangle {
            id: arm2
            anchors.top: body.top
            anchors.topMargin: head.height * 0.25
            anchors.horizontalCenter: body.horizontalCenter
            height: body.height
            width: head.border.width
            transform: Rotation {
                origin.x: arm1.width / 2
                origin.y: 0
                angle: -30
            }
            color: contentColor
            antialiasing: true
            opacity: errorCount > 6 ? 1.0 : 0.0
            visible: opacity > 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }


        Rectangle {
            id: leg1
            anchors.top: body.bottom
            anchors.horizontalCenter: body.horizontalCenter
            height: head.height * 3
            width: head.border.width
            transform: Rotation {
                origin.x: leg1.width / 2
                origin.y: 0
                angle: 30
            }
            color: contentColor
            antialiasing: true
            opacity: errorCount > 7 ? 1.0 : 0.0
            visible: opacity > 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }

        Rectangle {
            id: leg2
            anchors.top: body.bottom
            anchors.horizontalCenter: body.horizontalCenter
            height: head.height * 3
            width: head.border.width
            transform: Rotation {
                origin.x: leg2.width / 2
                origin.y: 0
                angle: -30
            }
            color: contentColor
            antialiasing: true
            opacity: errorCount > 8 ? 1.0 : 0.0
            visible: opacity > 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }
    }

    Text {
        text: "Peli päättyi"
        anchors.centerIn: parent
        opacity: gameOver ? 1.0 : 0.0
        visible: opacity > 0.0
        color: Theme.primaryColor
        font.pixelSize: parent.width / 6
        font.bold: true
        font.family: Theme.fontFamily
        style: Text.Outline
        styleColor: Theme.secondaryColor
        scale: visible ? 1.0 : 5.0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
        Behavior on scale {
            NumberAnimation {
                duration: 2000
            }
        }
    }

    Text {
        text: "ONNISTUIT"
        anchors.centerIn: parent
        opacity: success ? 1.0 : 0.0
        visible: opacity > 0.0
        color: Theme.primaryColor
        style: Text.Outline
        styleColor: Theme.secondaryColor
        font.pixelSize: parent.width / 6
        font.family: Theme.fontFamily
        scale: visible ? 1.0 : 5.0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
        Behavior on scale {
            NumberAnimation {
                duration: 2000
            }
        }
    }
}
