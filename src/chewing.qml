import QtQuick 2.0
import ".."
import "./chewing"
import com.jolla.keyboard 1.0

KeyboardLayout {
    property int zhuKeyHeight: keyHeight * 3 / 4
    type: "chewing"
    capsLockSupported: false
    splitSupported: false
    
    KeyboardRow {
        visible: keyboard.inSymView

        CharacterKey { symView: "1"; symView2: "@" }
        CharacterKey { symView: "2"; symView2: "/" }
        CharacterKey { symView: "3"; symView2: "\\" }
        CharacterKey { symView: "4"; symView2: "~" }
        CharacterKey { symView: "5"; symView2: "^" }
        CharacterKey { symView: "6"; symView2: "_" }
        CharacterKey { symView: "7"; symView2: "¥" }
        CharacterKey { symView: "8"; symView2: "€" }
        CharacterKey { symView: "9"; symView2: "$" }
        CharacterKey { symView: "0"; symView2: "£" }
    }

    KeyboardRow {
        visible: keyboard.inSymView

        CharacterKey { symView: "*"; symView2: "§" }
        CharacterKey { symView: "#"; symView2: "=" }
        CharacterKey { symView: "+"; symView2: "〈" }
        CharacterKey { symView: "-"; symView2: "〉" }
        CharacterKey { symView: "（"; symView2: "(" }
        CharacterKey { symView: "）"; symView2: ")" }
        CharacterKey { symView: "—"; symView2: "《" }
        CharacterKey { symView: "…"; symView2: "》" }
        CharacterKey { symView: "%"; symView2: "&" }
        CharacterKey { symView: "'"; symView2: "\"" }
    }

    KeyboardRow {
        visible: keyboard.inSymView

        ShiftKey {}

        CharacterKey { symView: "。"; symView2: "“" }
        CharacterKey { symView: "，"; symView2: "”" }
        CharacterKey { symView: "；"; symView2: ";" }
        CharacterKey { symView: "："; symView2: ":" }
        CharacterKey { symView: "、"; symView2: "·" }
        CharacterKey { symView: "！"; symView2: "!" }
        CharacterKey { symView: "？"; symView2: "?" }

        BackspaceKey {}
    }
    
    Row {
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView
        ZhuKey { caption: "ㄅ"}
        ZhuKey { caption: "ㄉ"}
        ZhuKey { caption: "ˇ"}
        ZhuKey { caption: "ˋ"}
        ZhuKey { caption: "ㄓ"}
        ZhuKey { caption: "ˊ"}
        ZhuKey { caption: "˙"}
        ZhuKey { caption: "ㄚ"}
        ZhuKey { caption: "ㄞ"}
        ZhuKey { caption: "ㄢ"}
    }
    
    Row {
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView
        ZhuKey { caption: "ㄆ"}
        ZhuKey { caption: "ㄊ"}
        ZhuKey { caption: "ㄍ"}
        ZhuKey { caption: "ㄐ"}
        ZhuKey { caption: "ㄔ"}
        ZhuKey { caption: "ㄗ"}
        ZhuKey { caption: "ㄧ"}
        ZhuKey { caption: "ㄛ"}
        ZhuKey { caption: "ㄟ"}
        ZhuKey { caption: "ㄣ"}
    }
    
    Row {
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView
        ZhuKey { caption: "ㄇ"}
        ZhuKey { caption: "ㄋ"}
        ZhuKey { caption: "ㄎ"}
        ZhuKey { caption: "ㄑ"}
        ZhuKey { caption: "ㄕ"}
        ZhuKey { caption: "ㄘ"}
        ZhuKey { caption: "ㄨ"}
        ZhuKey { caption: "ㄜ"}
        ZhuKey { caption: "ㄠ"}
        ZhuKey { caption: "ㄤ"}

    }

    Row {
        height: keyHeight * 3 / 4
        visible: !keyboard.inSymView
        ZhuKey { caption: "ㄈ"}
        ZhuKey { caption: "ㄌ"}
        ZhuKey { caption: "ㄏ"}
        ZhuKey { caption: "ㄒ"}
        ZhuKey { caption: "ㄖ"}
        ZhuKey { caption: "ㄙ"}
        ZhuKey { caption: "ㄩ"}
        ZhuKey { caption: "ㄝ"}
        ZhuKey { caption: "ㄡ"}
        ZhuKey { caption: "ㄥ"}
    }
 
    KeyboardRow {
        SymbolKey {
            width: symbolKeyWidthNarrow
            caption: keyboard.inSymView ? "注音" : "符號"
        }
        
        SmallCharacterKey {
            implicitWidth: punctuationKeyWidth
            fixedWidth: true
            separator: SeparatorState.HiddenSeparator
            caption: "ㄦ"
        }
        SpacebarKey {}
        
        BackspaceKey {
            visible: !keyboard.inSymView
        }

        EnterKey {}
    }
}
