#! /usr/bin/osascript

-- List actions to perform
set actions to {¬
	{action:"cd ~/pe/blossom; yarn test:unit:watch"}, ¬
	{action:"cd ~/pe/blossom; ./node_modules/.bin/flow stop; yarn flow:watch"}, ¬
	{action:"cd ~/pe/blossom; yarn lint:watch"}, ¬
	{action:"cd ~/pe/blossom; yarn start:local"}, ¬
	{action:"cd ~/pe/him; yarn build; yarn start"}, ¬
	{action:"cd ~/pe/fuzzylumpkins; yarn build; yarn start"} ¬
}
-- Count number of actions
set num_actions to count of actions

-- Start iTerm
tell application "iTerm"
	activate
	
	# Create new tab
	tell current window
		create tab with default profile
	end tell

	-- Split in 2 vertical panes
  tell session 1 of current tab of current window
    set name to "💮 Blossom"
    split vertically with default profile
  end tell
	
	-- Split right vertical pane in 3
  repeat with i from 2 to 5
	  set sessionId to i
    tell session sessionId of current tab of current window
      split horizontally with default profile
    end tell
  end repeat
	
	-- Execute actions
	repeat with i from 1 to num_actions
		tell session i of current tab of current window
			write text (action of item i of actions)
		end tell
	end repeat

-- Have to wait until the above commands are fired before setting the tab name or it gets overwritten by the command being run
delay 1
  repeat with i from 1 to 6
    tell session i of current tab of current window
      set name to "💮 Blossom"
    end tell
  end repeat

end tell
