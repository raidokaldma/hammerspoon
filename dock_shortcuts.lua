-- Bind cmd + ctrl + 1..9 to open an app from dock
-- Note, after reordering apps in the dock, plist gets updated with a delay of couple of seconds
for i = 1, 9 do
    hs.hotkey.bind({"cmd", "ctrl"}, tostring(i), function()
        -- See list of apps with command: defaults read ~/Library/Preferences/com.apple.dock.plist "persistent-apps"
        local dock = hs.plist.read("~/Library/Preferences/com.apple.dock.plist")
        local app = dock["persistent-apps"][i];
        if (app) then
            local appLabel = app["tile-data"]["file-label"]
            hs.application.launchOrFocus(appLabel)
        else
            print("No app for hotkey", i)
        end
    end)
end
