#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

; ATTENTION RESPONDENT: TOUCHING THE CODE BELOW IS NOT RECOMMENDED IF YOU DO NOT KNOW WHAT YOU'RE DOING.

; Numpad hotkeys

; Contact section
Numpad0::SendTerm("Contact. Engaging.")
Numpad1::SendTerm("Viscon on viromes, engaging.")
Numpad2::SendTerm("Viscon on necrotics, deploying.")
Numpad3::SendTerm("Viscon on parasitics, deploying.")

; Compromisation
Numpad4::SendTerm("Bodypack compromised. Recharging.")
Numpad5::SendTerm("Vitals compromised. Healing.")

; Retreat
NumpadSub::SendTerm("RIPCORD, RIPCORD.")

; Sector is clear
NumpadAdd::SendTerm("Sector is clear. Code 100.")

; Holding position
NumpadEnter::SendTerm("Overwatch, holding position.")

; Request status update
Numpad6::SendTerm("Requesting status update on all teams.")

; Outbreak
NumpadMult::SendTerm("Outbreak, outbreak!")

; Handles automatically sending out the terms
SendTerm(term) {
    Send "/"
    Sleep 80
    Send term
    Sleep 50
    Send "{Enter}"
}
