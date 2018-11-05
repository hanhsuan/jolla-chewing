import QtQuick 2.0
import ".."
import com.jolla.keyboard 1.0

KeyboardLayout {
    type: "chewing"
    capsLockSupported: false
    splitSupported: true
    KeyboardRow {
        separateButtonSizes: true
        CharacterKey { caption: "ㄅ"}
        CharacterKey { caption: "ㄉ"}
        CharacterKey { caption: "ˇ"}
        CharacterKey { caption: "ˋ"}
        CharacterKey { caption: "ㄓ"}
        CharacterKey { caption: "ˊ"}
        CharacterKey { caption: "˙"}
        CharacterKey { caption: "ㄚ"}
        CharacterKey { caption: "ㄞ"}
        CharacterKey { caption: "ㄢ"}
    }

    KeyboardRow {
        separateButtonSizes: true
        CharacterKey { caption: "ㄆ"}
        CharacterKey { caption: "ㄊ"}
        CharacterKey { caption: "ㄍ"}
        CharacterKey { caption: "ㄐ"}
        CharacterKey { caption: "ㄔ"}
        CharacterKey { caption: "ㄗ"}
        CharacterKey { caption: "ㄧ"}
        CharacterKey { caption: "ㄛ"}
        CharacterKey { caption: "ㄟ"}
        CharacterKey { caption: "ㄣ"}
    }

    KeyboardRow {
        separateButtonSizes: true
        CharacterKey { caption: "ㄇ"}
        CharacterKey { caption: "ㄋ"}
        CharacterKey { caption: "ㄎ"}
        CharacterKey { caption: "ㄑ"}
        CharacterKey { caption: "ㄕ"}
        CharacterKey { caption: "ㄘ"}
        CharacterKey { caption: "ㄨ"}
        CharacterKey { caption: "ㄜ"}
        CharacterKey { caption: "ㄠ"}
        CharacterKey { caption: "ㄤ"}

    }

    KeyboardRow {
        separateButtonSizes: true
        CharacterKey { caption: "ㄈ"}
        CharacterKey { caption: "ㄌ"}
        CharacterKey { caption: "ㄏ"}
        CharacterKey { caption: "ㄒ"}
        CharacterKey { caption: "ㄖ"}
        CharacterKey { caption: "ㄙ"}
        CharacterKey { caption: "ㄩ"}
        CharacterKey { caption: "ㄝ"}
        CharacterKey { caption: "ㄡ"}
        CharacterKey { caption: "ㄥ"}
    }
 
    KeyboardRow {
        separateButtonSizes: true
        SymbolKey {
            width: symbolKeyWidthNarrow
            caption: "標點符號"
        }
        
        SmallCharacterKey {
            implicitWidth: punctuationKeyWidth
            fixedWidth: true
            separator: SeparatorState.HiddenSeparator
            caption: "ㄦ"
        }
        SpacebarKey {}
        
        BackspaceKey {}
        EnterKey {}
    }
}
