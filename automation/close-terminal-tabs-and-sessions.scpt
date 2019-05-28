#! /usr/bin/osascript

-- Script to close all tabs and sessions, leaving just a single tab with a single session

-- Start iTerm
tell application "iTerm"
    activate
    tell current window

        tell current session of current tab
            write text ("pkill node")
        end tell

        # Close all sessions of all tabs other than the 1st one
        repeat with tabId from 2 to count of tabs
            if (tabId is not equal to current tab) then
                repeat with sessionId from 1 to count of sessions of tab 1
                    tell tab 1
                        close session 1
                    end tell
                end repeat
            end if
        end repeat

        # Leave one session open on the current tab
        repeat with i from 2 to count of sessions of current tab
            tell current tab
                close current session
            end tell
        end repeat

        delay 1

    end tell
end tell
