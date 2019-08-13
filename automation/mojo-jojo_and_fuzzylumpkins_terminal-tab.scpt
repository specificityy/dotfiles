#! /usr/bin/osascript

-- List actions to perform
set actions to {¬
	{action:"cd ~/Projects/mojo-jojo; yarn build:watch"}, ¬
	{action:"cd ~/Projects/fuzzylumpkins; yarn build:watch"}, ¬
  {action:"cd ~/Projects/him; yarn build:watch"}, ¬
  {action:"cd ~/Projects/mojo-jojo; yarn start:watch"}, ¬
  {action:"cd ~/Projects/fuzzylumpkins; yarn start:watch"}, ¬
  {action:"cd ~/Projects/him; yarn start:watch"} ¬
}
-- Count number of actions
set num_actions to count of actions

-- Set cols and lines
set num_cols to round (num_actions / 2)
set num_lines to round (num_actions / num_cols) rounding up

-- Start iTerm
tell application "iTerm"
	activate
	
	# Create new tab
	tell current window
		create tab with default profile
	end tell
	
	-- Prepare horizontal panes
	repeat with i from 1 to num_lines
		tell session 1 of current tab of current window
			if i < num_lines then
				split horizontally with default profile
			end if
		end tell
	end repeat
	
	-- Prepare vertical panes
	set sessid to 1
	repeat with i from 1 to num_lines
		if i is not 1 then set sessid to sessid + num_cols
		if i is not num_lines or num_actions is num_cols * num_lines then
			set cols to num_cols - 1
		else
			set cols to (num_actions - ((num_lines - 1) * num_cols)) - 1
		end if
		repeat with j from 1 to (cols)
			tell session sessid of current tab of current window
				split vertically with default profile
			end tell
		end repeat
	end repeat
	
	-- Execute actions
	repeat with i from 1 to num_actions
		tell session i of current tab of current window
			write text (action of item i of actions)
      if i is 2 then delay 5
		end tell
	end repeat

-- Have to wait until the above commands are fired before setting the tab name or it gets overwritten by the command being run
  delay 1
  repeat with i from 1 to num_actions
    tell session i of current tab of current window
      set name to "🎃 Mojo, Him, Fuzzy"
    end tell
  end repeat
end tell
