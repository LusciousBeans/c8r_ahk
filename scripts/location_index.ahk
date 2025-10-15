#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

; ATTENTION RESPONDENT: TOUCHING THE CODE BELOW IS NOT RECOMMENDED IF YOU DO NOT KNOW WHAT YOU'RE DOING.

toggle := true

locations := Map()

multiKeys := [
    ; NEXUS
    {keys: ["nexus"], value: "APEX"},
    {keys: ["nrr"], value: "DUTY"},
    {keys: ["prison"], value: "KILO"},
    {keys: ["nir", "interrogation room"], value: "SWORD"},
    {keys: ["spawn"], value: "HARDPOINT DELTA"},

    ; PLAZA
    {keys: ["plaza"], value: "HOTEL"},
    {keys: ["residential block"], value: "OSCAR"},
    {keys: ["subway"], value: "GOLF"},
    {keys: ["bridge"], value: "SPAN"},

    ; POINT B
    {keys: ["point b"], value: "HARDPOINT BRAVO"},
    {keys: ["trainstation"], value: "ECHO"},
    {keys: ["ca office"], value: "AXIS"},
    {keys: ["border"], value: "LOCK"},

    ; THE OUTLANDS
    {keys: ["outlands"], value: "EXCLUSION"},
    {keys: ["olg"], value: "GATEWAY"},
    {keys: ["point a"], value: "HARDPOINT ALPHA"},
    {keys: ["point c", "sewers"], value: "HARDPOINT CHARLIE"}
]

for _, entry in multiKeys
    for _, k in entry.keys
        locations[k] := entry.value

F1:: {
    global toggle
    toggle := !toggle
    if toggle
        SoundBeep 1000, 200
    else
        SoundBeep 400, 200
}

MakeHotstring(k, expansion) {
    Hotstring(":*:" k, (*) => Send("{Text}" . (toggle ? expansion : k)))
}

for key, expansion in locations
    MakeHotstring(key, expansion)
