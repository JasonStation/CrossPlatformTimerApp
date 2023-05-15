import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQml 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Stop Watch")

    Column {

            anchors.centerIn: parent

            Timer {
                id: myTimer
                repeat: true
                interval: 100
                running: false
                onTriggered: {
                    currSeconds = currSeconds + 1
                    var mustDecimal = currSeconds / 10
                    if(mustDecimal % 1 == 0) mustDecimal = mustDecimal + ".0"
                    stopWatchTimer.text = mustDecimal
                }
            }

            Text {
                anchors.centerIn: children
                id: stopWatchTimer
                text: "0.0"
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 60
                textFormat: Text.PlainText
            }

            Row {

                spacing: 30

                Button {
                    id: stopTimerButton
                    text: "Stop"
                    font.pointSize: 20
                    onClicked:
                    {
                        myTimer.stop()
                    }
                }


                Button {
                    id: startTimerButton
                    text: "Start"
                    font.pointSize: 20
                    onClicked:
                    {
                        myTimer.start()
                    }
                }

                Button{
                    id: resetTimerButton
                    text: "Reset"
                    font.pointSize: 20
                    onClicked:{
                        currSeconds = 0.0
                        stopWatchTimer.text = "0.0"
                    }
                }



            }
        }

        property double currSeconds: 0.0
}
