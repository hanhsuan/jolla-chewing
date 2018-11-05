import ".."
import QtQuick 2.0
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
        SmallCharacterKey { caption: "ㄆ" }
        SmallCharacterKey { caption: "ㄊ" }
        SmallCharacterKey { caption: "ㄍ" }
        SmallCharacterKey { caption: "ㄐ" }
        SmallCharacterKey { caption: "ㄔ" }
        SmallCharacterKey { caption: "ㄗ" }
        SmallCharacterKey { caption: "ㄧ" }
        SmallCharacterKey { caption: "ㄛ" }
        SmallCharacterKey { caption: "ㄟ" }
        SmallCharacterKey { caption: "ㄣ" }
    }

    KeyboardRow {
        SmallCharacterKey { caption: "ㄇ" }
        SmallCharacterKey { caption: "ㄋ" }
        SmallCharacterKey { caption: "ㄎ" }
        SmallCharacterKey { caption: "ㄑ" }
        SmallCharacterKey { caption: "ㄕ" }
        SmallCharacterKey { caption: "ㄘ" }
        SmallCharacterKey { caption: "ㄨ" }
        SmallCharacterKey { caption: "ㄜ" }
        SmallCharacterKey { caption: "ㄠ" }
        SmallCharacterKey { caption: "ㄤ" }
    }

    KeyboardRow {
        SmallCharacterKey { caption: "ㄈ" }
        SmallCharacterKey { caption: "ㄌ" }
        SmallCharacterKey { caption: "ㄏ" }
        SmallCharacterKey { caption: "ㄒ" }
        SmallCharacterKey { caption: "ㄖ" }
        SmallCharacterKey { caption: "ㄙ" }
        SmallCharacterKey { caption: "ㄩ" }
        SmallCharacterKey { caption: "ㄝ" }
        SmallCharacterKey { caption: "ㄡ" }
        SmallCharacterKey { caption: "ㄥ" }
        BackspaceKey {
        }

    }

    KeyboardRow {
        SymbolKey {
            width: symbolKeyWidthNarrow
            caption: "符號"
        }

        SpacebarKey {}

        SmallCharacterKey {
            implicitWidth: punctuationKeyWidth
            fixedWidth: true
            separator: SeparatorState.HiddenSeparator
            caption: "ㄦ"
        }
        
        BackspaceKey {}
        EnterKey {}
    }
}
