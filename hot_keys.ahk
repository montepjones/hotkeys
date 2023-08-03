
; *************Hotkeys*************
^!s::
{
    clip_to_quote() ; Ctrl+Alt+S to convert clipboard to quotes for sql
}

; *************Functions*************
;join an array with a separator
Join(sep, params*) {
    for index,param in params
        str .= param . sep
    return SubStr(str, 1, -StrLen(sep))
}

;convert clipboard to quotes for sql
clip_to_quote() {
    clip_board := A_Clipboard
    items := StrSplit(clip_board, "`r`n")
    new_clip := Array()
    For k, v in items
        
        {
            if k = items.Length 
            {
                new_clip.Push RegExReplace(Trim(v), "^(.*)$", "'$1'")
            }
            Else
            {
                new_clip.Push RegExReplace(Trim(v), "^(.*)$", "'$1',")
            }
          
        }
        A_Clipboard := Join("`r`n", new_clip*)
    
}

