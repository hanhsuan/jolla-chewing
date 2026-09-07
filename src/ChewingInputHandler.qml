import H.H.chewing 1.0
import QtQuick 2.0
import Sailfish.Silica 1.0
import com.jolla.keyboard 1.0
import com.meego.maliitquick 1.0

InputHandler {
    property string preedit
    property var candidateGroup
    property string candidateString
    property var candidates: ListModel { }

    function handleKeyClick() {
        if (pressedKey.key === Qt.Key_Backspace) {
            if (preedit !== "") {
                chewing.handleBackSpace();
                updateCandidates();
                return true;
            }
        } else if (pressedKey.key === Qt.Key_Return) {
            if (preedit !== "") {
                commit(preedit);
                return true;
            }
        } else if (!keyboard.inSymView || pressedKey.key === Qt.Key_Space) {
            chewing.handleDefault(pressedKey.text);
            updateCandidates();
            return true;
        }
        if (preedit !== "") {
            commit(preedit + pressedKey.text);
            return true;
        }
        return false;
    }

    function commit(text) {
        MInputMethodQuick.sendCommit(text);
        reset();
    }

    function accept(index) {
        if (index === 0)
            MInputMethodQuick.sendCommit(candidates.get(index).text);
        else
            MInputMethodQuick.sendCommit(preedit.substring(0, (preedit.length - 1)) + candidates.get(index).text);
        reset();
    }

    function reset() {
        candidates.clear();
        chewing.handleReset();
        chewing.handleBackSpace();
        preedit = "";
    }

    Chewing {
        id: chewing
    }

    Component {
        id: pasteComponent

        PasteButton {
            onClicked: {
                if (preedit.length > 0)
                    commit(preedit);

                MInputMethodQuick.sendCommit(Clipboard.text);
                keyboard.expandedPaste = false;
            }
        }
    }

    topItem: Component {
        TopItem {
            id: topItem

            Row {
                SilicaListView {
                    id: listView

                    model: candidates
                    orientation: ListView.Horizontal
                    width: topItem.width
                    height: topItem.height
                    boundsBehavior: !keyboard.expandedPaste && Clipboard.hasText ? Flickable.DragOverBounds : Flickable.StopAtBounds
                    header: pasteComponent
                    onCountChanged: positionViewAtBeginning()
                    onDraggingChanged: {
                        if (!dragging && !keyboard.expandedPaste && contentX < -(headerItem.width + Theme.paddingLarge)) {
                            keyboard.expandedPaste = true;
                            positionViewAtBeginning();
                        }
                    }

                    Connections {
                        target: Clipboard
                        onTextChanged: {
                            if (Clipboard.hasText)
                                positionerTimer.restart();

                        }
                    }

                    Timer {
                        id: positionerTimer

                        interval: 10
                        onTriggered: listView.positionViewAtBeginning()
                    }

                    delegate: BackgroundItem {
                        id: backGround

                        onClicked: accept(model.index)
                        width: candidateText.width + Theme.paddingLarge * 2
                        height: topItem.height

                        Text {
                            id: candidateText
                            anchors.centerIn: parent
                            color: highlighted ? Theme.highlightColor : Theme.primaryColor
                            font { pixelSize: Theme.fontSizeSmall; family: Theme.fontFamily}
                            text: model.text

                            font {
                                pixelSize: Theme.fontSizeSmall
                                family: Theme.fontFamily
                            }
                        }
                    }
                }
            }
        }
    }

    verticalItem: Component {
        Item {
            id: verticalContainer

            SilicaListView {
                id: verticalList

                model: chewing.candidates
                anchors.fill: parent
                clip: true
                boundsBehavior: Flickable.StopAtBounds

                header: Component {
                    PasteButtonVertical {
                        visible: Clipboard.hasText
                        width: verticalList.width
                        height: visible ? geometry.keyHeightLandscape : 0
                        popupParent: verticalContainer
                        popupAnchor: 2 // center
                        onClicked: {
                            commit(preedit);
                            MInputMethodQuick.sendCommit(Clipboard.text);
                        }
                    }
                }

                delegate: BackgroundItem {
                    onClicked: {
                        accept(model.index);
                    }
                    width: parent.width
                    height: geometry.keyHeightLandscape // assuming landscape!

                    Text {
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenter: parent.verticalCenter
                        color: index === 0 ? Theme.highlightColor : Theme.primaryColor
                        font.pixelSize: Theme.fontSizeSmall
                        fontSizeMode: Text.HorizontalFit
                        text: model.text
                    }
                }
            }
        }
    }

    function accept(index){
        if(index === 0){
            MInputMethodQuick.sendCommit(candidates.get(index).text)
        }
        else{
            MInputMethodQuick.sendCommit(preedit.substring(0,(preedit.length-1))+candidates.get(index).text)
        }
            reset()
    }
    
    function updateCandidates() {
        var candidateList;
        candidates.clear();
        preedit = chewing.getPreedit();
        candidateList = (preedit + " " + chewing.getCandidate()).trim().split(/\s+/);
        for (var i = 0; i < candidateList.length; i++) {
            if (candidateList[i] !== "")
                candidates.append({
                "text": candidateList[i]
            });

        }
        MInputMethodQuick.sendPreedit(preedit);
    }

    function reset(){
        candidates.clear()
        chewing.handleReset()
        chewing.handleBackSpace()
        preedit = ""
    }
}
