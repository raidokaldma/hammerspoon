local gridSize = 3

-- Move right
hs.hotkey.bind({"ctrl", "alt"}, "right", function()
    moveAndResizeWindow(1, 1)
end)

-- Move right, width = 2 spans
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "right", function()
    moveAndResizeWindow(2, 1)
end)

-- Move left
hs.hotkey.bind({"ctrl", "alt"}, "left", function()
    moveAndResizeWindow(1, -1)
end)

-- Move left, width = 2 spans
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "left", function()
    moveAndResizeWindow(2, -1)
end)

function moveAndResizeWindow(spanCount, moveDirection)
    local win = hs.window.focusedWindow()
    if not win then return end

    local f = win:frame()
    local s = win:screen():frame()

    local oneSpanWidth = s.w / gridSize
    local width = oneSpanWidth * spanCount

    -- Position 0,1,2,...,N
    local position = math.ceil((f.x - s.x) / s.w * gridSize)
    local nextPosition = position + moveDirection

    -- Ensure window does not move off screen when moving left
    if nextPosition < 0 then nextPosition = 0 end
    -- Ensure window does not move off screen when moving right, take into account span size too
    if nextPosition + spanCount > gridSize then nextPosition = gridSize - spanCount end

    -- Note, s.x = width of dock if dock is on the left side of the screen
    f.x = s.x + nextPosition * oneSpanWidth
    f.y = s.y
    f.h = s.h
    f.w = width
    win:setFrame(f)
end
