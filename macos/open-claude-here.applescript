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

	tell application "iTerm2"
		activate
		delay 0.3
		if (count of windows) = 0 then
			create window with default profile
		else
			tell current window to create tab with default profile
		end if
		tell current session of current window to write text "cd " & quoted form of folderPath & " && __CLAUDE_PATH__"
	end tell
end run
