function sum(values)
    local sum = 0
    for _, v in ipairs(values) do
        sum = sum + v
    end
    return sum
end

-- {1,2,1} -> {{x=0,w=1}, {x=1,w=2}, {x=3,w=1}}
function calculateSegments(proportions)
  local segments = {}
  do
    local startCol = 0
    for _,proportion in ipairs(proportions) do
      table.insert(segments, {x=startCol, w=proportion})
      startCol = startCol + proportion
    end
  end
  return segments
end

function currentSegmentIdx(win, segments)
  local g = hs.grid.get(win)
  for i, s in ipairs(segments) do
    if g.x >= s.x and g.x < s.x + s.w then
      return i
    end
  end
end

function moveWindow(proportions, moveDelta)
    local win = hs.window.focusedWindow()
    if not win then return end

    local gridSize = sum(proportions)
    hs.grid.setGrid({w=gridSize,h=1})

    local segments = calculateSegments(proportions)
    local currentSegmentIdx = currentSegmentIdx(win, segments)
    local nextSegmentIdx = currentSegmentIdx + moveDelta;
    -- Ensure value is not out of bounds when window already at the edge
    nextSegmentIdx = hs.math.max(hs.math.min(nextSegmentIdx, #segments), 1)
    local nextSegment = segments[nextSegmentIdx]
    hs.grid.set(win, {nextSegment.x, 0, nextSegment.w, 1})
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", function() moveWindow({2,3,2}, 1) end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", function() moveWindow({2,3,2}, -1) end)
hs.hotkey.bind({"ctrl", "alt"}, "right", function() moveWindow({1,1}, 1) end)
hs.hotkey.bind({"ctrl", "alt"}, "left", function() moveWindow({1,1}, -1) end)
