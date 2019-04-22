import QtQuick 2.0
import com.meego.maliitquick 1.0
import Sailfish.Silica 1.0
import com.jolla.keyboard 1.0
import H.H.chewing 1.0

InputHandler {
    property string preedit
    property var candidateGroup
    property string candidateString
    property var candidates: ListModel { }
    Chewing {
        id:chewing
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
                        }
                    }
                    onCountChanged: positionViewAtBeginning()
                    onDraggingChanged: {
                        if (!dragging && !keyboard.expandedPaste && contentX < -(headerItem.width + Theme.paddingLarge)) {
                            keyboard.expandedPaste = true
                            positionViewAtBeginning()
                        }
                    }

                    Connections {
                        target: chewing
                        onCandidatesUpdated: listView.positionViewAtBeginning()
                    }

                    Connections {
                        target: Clipboard
                        onTextChanged: {
                            if (Clipboard.hasText) {
                                positionerTimer.restart()
                            }
                        }
                    }

                    Timer {
                        id: positionerTimer
                        interval: 10
                        onTriggered: listView.positionViewAtBeginning()
                    }
                }
            }
        }
    }

    Component {
        id: pasteComponent
        PasteButton {
            onClicked: {
                if (preedit.length > 0) {
                    commit(preedit)
                }
                MInputMethodQuick.sendCommit(Clipboard.text)
                keyboard.expandedPaste = false
            }
        }
    }

    verticalItem: Component {
            Item {
                id: verticalContainer

                SilicaListView {
                    id: verticalList

                    model: candidates
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
                                commit(preedit)
                                MInputMethodQuick.sendCommit(Clipboard.text)
                            }
                        }
                    }

                    delegate: BackgroundItem {
                        onClicked:{ 
							accept(model.index)
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

                    Connections {
                        target: chewing
                        onCandidatesUpdated: {
                            if (!clipboardChange.running) {
                                verticalList.positionViewAtIndex(0, ListView.Beginning)
                            }
                        }
                    }
                    Connections {
                        target: Clipboard
                        onTextChanged: {
                            verticalList.positionViewAtBeginning()
                            clipboardChange.restart()
                        }
                    }
                    Timer {
                        id: clipboardChange
                        interval: 1000
                    }
                }
            }
        }
    function handleKeyClick() {
            var zhuYinString = "ㄅㄉˇˋㄓˊ˙ㄚㄞㄢㄆㄊㄍㄐㄔㄗㄧㄛㄟㄣㄇㄋㄎㄑㄕㄘㄨㄜㄠㄤㄈㄌㄏㄒㄖㄙㄩㄝㄡㄥㄦ"
            var handled = false
            if(pressedKey.key === Qt.Key_Backspace){
                if(preedit!==""){
                    chewing.handleBackSpace()
                    handled=true
                }
            }
            else if(pressedKey.key === Qt.Key_Return){
                if(preedit !== ""){
                    commit(preedit)
                    handled = true
                }
            }
            else if (zhuYinString.indexOf(pressedKey.text) >= 0 ||
                     pressedKey.key === Qt.Key_Space) {
                chewing.handleDefault(pressedKey.text)
                handled=true
            } else {
                if (preedit !== "") {
                    commit(preedit + pressedKey.text)
                    handled = true
                }
            }
            updateCandidates()
            return handled
        }


    function commit(text) {
        MInputMethodQuick.sendCommit(text)
        reset()
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
        candidates.clear()
        preedit=chewing.getPreedit();
        candidateString=chewing.getCandidate()
        
        candidateString=preedit+" "+candidateString
        if(candidateString.length){
            candidateGroup=candidateString.split(' ')
            console.warn("candidateGroup: ", candidateGroup)
            for(var i=0 ; i<candidateGroup.length;i++){
                if(i !== 1){
                    // Skips empty entries in the candidate string
                    // TODO: Fix the trailing whitespace on the QML plugin side
                    if (candidateGroup[i] === "") {
                        continue
                    }
                    candidates.append({text: candidateGroup[i]})
                }
            }
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
