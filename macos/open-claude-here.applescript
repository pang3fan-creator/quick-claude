(*
	Open Claude Here
	在当前 Finder 窗口中打开 iTerm2 并启动 Claude Code
*)

on run
	tell application "Finder"
		if not (exists window 1) then
			display dialog "No Finder window is open." buttons {"OK"} default button 1
			return
		end if
		set targetFolder to target of front window as alias
	end tell

	set folderPath to POSIX path of targetFolder
	set escapedPath to quoted form of folderPath

	-- Run script dynamically to avoid keyword conflicts on macOS 26.4
	-- (default, text, profile are reserved AppleScript keywords)
	set itermCode to "tell application \"iTerm2\"" & return & ¬
		"	activate" & return & ¬
		"	delay 0.3" & return & ¬
		"	set winCount to count of windows" & return & ¬
		"	if winCount = 0 then" & return & ¬
		"		create window with default profile" & return & ¬
		"	else" & return & ¬
		"		tell current window to create tab with default profile" & return & ¬
		"	end if" & return & ¬
		"	tell current session of current window to write text \"cd \" & " & escapedPath & " & \" && __CLAUDE_PATH__\"" & return & ¬
		"end tell"

	run script itermCode
end run
