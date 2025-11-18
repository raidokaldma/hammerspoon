function moveRight(gridSize)
    hs.grid.setGrid(gridSize).pushWindowRight()
end
function moveLeft(gridSize)
    hs.grid.setGrid(gridSize).pushWindowLeft()
end
function resizeWider(gridSize)
    hs.grid.setGrid(gridSize).resizeWindowWider()
end
function resizeThinner(gridSize)
    hs.grid.setGrid(gridSize).resizeWindowThinner()
end

-- Move and resize on 3x1 grid
function moveRight3() moveRight("3x1") end
function moveLeft3() moveLeft("3x1") end
function resizeWider3() resizeWider("3x1") end
function resizeThinner3() resizeThinner("3x1") end

hs.hotkey.bind({"ctrl", "alt"}, "right", moveRight3, null, moveRight3)
hs.hotkey.bind({"ctrl", "alt"}, "left", moveLeft3, null, moveLeft3)
hs.hotkey.bind({"ctrl", "alt"}, "up", resizeWider3, null, resizeWider3)
hs.hotkey.bind({"ctrl", "alt"}, "down", resizeThinner3, null, resizeThinner3)

-- Move and resize on 7x1 grid
function moveRight7() moveRight("7x1") end
function moveLeft7() moveLeft("7x1") end
function resizeWider7() resizeWider("7x1") end
function resizeThinner7() resizeThinner("7x1") end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", moveRight7, null, moveRight7)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", moveLeft7, null, moveLeft7)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "up", resizeWider7, null, resizeWider7)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "down", resizeThinner7, null, resizeThinner7)
