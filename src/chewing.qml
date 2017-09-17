import QtQuick 2.0
import ".."
import com.jolla.keyboard 1.0

KeyboardLayout {
    type: "chewing"
    capsLockSupported: false
    splitSupported: true
    KeyboardRow {
        SmallCharacterKey { caption: "ㄅ"}
        SmallCharacterKey { caption: "ㄉ"}
        SmallCharacterKey { caption: "ˇ"}
        SmallCharacterKey { caption: "ˋ"}
        SmallCharacterKey { caption: "ㄓ"}
        SmallCharacterKey { caption: "ˊ"}
        SmallCharacterKey { caption: "˙"}
        SmallCharacterKey { caption: "ㄚ"}
        SmallCharacterKey { caption: "ㄞ"}
        SmallCharacterKey { caption: "ㄢ"}
        SmallCharacterKey { caption: "ㄦ"}
    }

    KeyboardRow {
        SmallCharacterKey { caption: "ㄆ"}
        SmallCharacterKey { caption: "ㄊ"}
        SmallCharacterKey { caption: "ㄍ"}
        SmallCharacterKey { caption: "ㄐ"}
        SmallCharacterKey { caption: "ㄔ"}
        SmallCharacterKey { caption: "ㄗ"}
        SmallCharacterKey { caption: "ㄧ"}
        SmallCharacterKey { caption: "ㄛ"}
        SmallCharacterKey { caption: "ㄟ"}
        SmallCharacterKey { caption: "ㄣ"}
    }

    KeyboardRow {
        SmallCharacterKey { caption: "ㄇ"}
        SmallCharacterKey { caption: "ㄋ"}
        SmallCharacterKey { caption: "ㄎ"}
        SmallCharacterKey { caption: "ㄑ"}
        SmallCharacterKey { caption: "ㄕ"}
        SmallCharacterKey { caption: "ㄘ"}
        SmallCharacterKey { caption: "ㄨ"}
        SmallCharacterKey { caption: "ㄜ"}
        SmallCharacterKey { caption: "ㄠ"}
        SmallCharacterKey { caption: "ㄤ"}

    }

    KeyboardRow {

        SmallCharacterKey { caption: "ㄈ"}
        SmallCharacterKey { caption: "ㄌ"}
        SmallCharacterKey { caption: "ㄏ"}
        SmallCharacterKey { caption: "ㄒ"}
        SmallCharacterKey { caption: "ㄖ"}
        SmallCharacterKey { caption: "ㄙ"}
        SmallCharacterKey { caption: "ㄩ"}
        SmallCharacterKey { caption: "ㄝ"}
        SmallCharacterKey { caption: "ㄡ"}
        SmallCharacterKey { caption: "ㄥ"}
        BackspaceKey {}
        }
 
KeyboardRow {
	SymbolKey {
            width: symbolKeyWidthNarrow
	    caption: "標點符號"
        }
        SpacebarKey {
            fixedWidth: true
        }

        EnterKey {}
        }
}
