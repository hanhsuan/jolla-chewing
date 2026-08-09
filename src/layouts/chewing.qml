import ".."
import "./chewing"
import QtQuick 2.0
import com.jolla.keyboard 1.0

KeyboardLayout {
    property int bopomofoKeyHeight: keyHeight * 3 / 4

    type: "chewing"
    capsLockSupported: false
    splitSupported: true

    KeyboardRow {
        visible: keyboard.inSymView

        CharacterKey {
            symView: "1"
            symView2: "@"
        }

        CharacterKey {
            symView: "2"
            symView2: "/"
        }

        CharacterKey {
            symView: "3"
            symView2: "\\"
        }

        CharacterKey {
            symView: "4"
            symView2: "~"
        }

        CharacterKey {
            symView: "5"
            symView2: "^"
        }

        CharacterKey {
            symView: "6"
            symView2: "_"
        }

        CharacterKey {
            symView: "7"
            symView2: "¥"
        }

        CharacterKey {
            symView: "8"
            symView2: "€"
        }

        CharacterKey {
            symView: "9"
            symView2: "$"
        }

        CharacterKey {
            symView: "0"
            symView2: "£"
        }

    }

    KeyboardRow {
        visible: keyboard.inSymView

        CharacterKey {
            symView: "*"
            symView2: "§"
        }

        CharacterKey {
            symView: "#"
            symView2: "="
        }

        CharacterKey {
            symView: "+"
            symView2: "〈"
        }

        CharacterKey {
            symView: "-"
            symView2: "〉"
        }

        CharacterKey {
            symView: "（"
            symView2: "("
        }

        CharacterKey {
            symView: "）"
            symView2: ")"
        }

        CharacterKey {
            symView: "—"
            symView2: "《"
        }

        CharacterKey {
            symView: "…"
            symView2: "》"
        }

        CharacterKey {
            symView: "%"
            symView2: "&"
        }

        CharacterKey {
            symView: "'"
            symView2: "\""
        }

    }

    KeyboardRow {
        visible: keyboard.inSymView

        ShiftKey {
        }

        CharacterKey {
            symView: "「"
            symView2: "『"
        }

        CharacterKey {
            symView: "」"
            symView2: "』"
        }

        CharacterKey {
            symView: "；"
            symView2: ";"
        }

        CharacterKey {
            symView: "："
            symView2: ":"
        }

        CharacterKey {
            symView: "、"
            symView2: "·"
        }

        CharacterKey {
            symView: "！"
            symView2: "!"
        }

        CharacterKey {
            symView: "？"
            symView2: "?"
        }

        CharacterKey {
            symView: "。"
            symView2: "."
        }

    }

    KeyboardRow {
        followRowHeight: false
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView

        BopomofoKey {
            caption: "ㄅ"
        }

        BopomofoKey {
            caption: "ㄉ"
        }

        BopomofoKey {
            caption: "ˇ"
        }

        BopomofoKey {
            caption: "ˋ"
        }

        BopomofoKey {
            caption: "ㄓ"
        }

        BopomofoKey {
            caption: "ˊ"
        }

        BopomofoKey {
            caption: "˙"
        }

        BopomofoKey {
            caption: "ㄚ"
        }

        BopomofoKey {
            caption: "ㄞ"
        }

        BopomofoKey {
            caption: "ㄢ"
        }

    }

    KeyboardRow {
        followRowHeight: false
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView

        BopomofoKey {
            caption: "ㄆ"
        }

        BopomofoKey {
            caption: "ㄊ"
        }

        BopomofoKey {
            caption: "ㄍ"
        }

        BopomofoKey {
            caption: "ㄐ"
        }

        BopomofoKey {
            caption: "ㄔ"
        }

        BopomofoKey {
            caption: "ㄗ"
        }

        BopomofoKey {
            caption: "ㄧ"
        }

        BopomofoKey {
            caption: "ㄛ"
        }

        BopomofoKey {
            caption: "ㄟ"
        }

        BopomofoKey {
            caption: "ㄣ"
        }

    }

    KeyboardRow {
        followRowHeight: false
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView

        BopomofoKey {
            caption: "ㄇ"
        }

        BopomofoKey {
            caption: "ㄋ"
        }

        BopomofoKey {
            caption: "ㄎ"
        }

        BopomofoKey {
            caption: "ㄑ"
        }

        BopomofoKey {
            caption: "ㄕ"
        }

        BopomofoKey {
            caption: "ㄘ"
        }

        BopomofoKey {
            caption: "ㄨ"
        }

        BopomofoKey {
            caption: "ㄜ"
        }

        BopomofoKey {
            caption: "ㄠ"
        }

        BopomofoKey {
            caption: "ㄤ"
        }

    }

    KeyboardRow {
        followRowHeight: false
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView

        BopomofoKey {
            caption: "ㄈ"
        }

        BopomofoKey {
            caption: "ㄌ"
        }

        BopomofoKey {
            caption: "ㄏ"
        }

        BopomofoKey {
            caption: "ㄒ"
        }

        BopomofoKey {
            caption: "ㄖ"
        }

        BopomofoKey {
            caption: "ㄙ"
        }

        BopomofoKey {
            caption: "ㄩ"
        }

        BopomofoKey {
            caption: "ㄝ"
        }

        BopomofoKey {
            caption: "ㄡ"
        }

        BopomofoKey {
            caption: "ㄥ"
        }

    }

    KeyboardRow {
        splitIndex: 4

        SymbolKey {
            width: symbolKeyWidthNarrow
            caption: keyboard.inSymView ? "注音" : "符號"

            // Needed to swap the ㄦ and punctuation key in symview
            Connections {
                target: keyboard
                onInSymViewChanged: updateSizes()
            }

        }

        SmallCharacterKey {
            active: !keyboard.inSymView
            implicitWidth: punctuationKeyWidth
            fixedWidth: keyboard.portraitMode ? true : false
            separator: SeparatorState.HiddenSeparator
            caption: "ㄦ"

            Connections {
                target: keyboard
                onPortraitModeChanged: updateSizes()
            }

        }

        ChineseContextAwareCommaKey {
            active: keyboard.inSymView
        }

        SpacebarKey {
        }

        SpacebarKey {
            active: splitActive
            languageLabel: ""
        }

        BackspaceKey {
            width: punctuationKeyWidth
        }

        EnterKey {
        }

    }

}
