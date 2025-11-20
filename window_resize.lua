-- Regular table would leak memory (some frames would never be cleaned up),
-- so using meta table with weak keys here in order to prevents memory leaks
local windowFrames = setmetatable({}, {__mode = "k"})

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "up", function()
    local win = hs.window.focusedWindow()
    if not win then return end

    local f = win:frame()
    local s = win:screen():frame()
    local isMaximized = f.w == s.w and f.h == s.h and f.x == s.x and f.y == s.y

    -- Already maximized, do nothing
    if isMaximized then return end

    local id = win:id()
    windowFrames[id] = f
    win:maximize()
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "down", function()
    local win = hs.window.focusedWindow()
    if not win then return end

    local id = win:id()
    if windowFrames[id] then
        -- Restore previous size
        win:setFrame(windowFrames[id])
        windowFrames[id] = nil
    end
end)
