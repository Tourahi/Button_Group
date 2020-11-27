local ButtonGroup = {};
ButtonGroup.__index = ButtonGroup;

function ButtonGroup.new(groupName,margin,font)
  print(margin)
  return setmetatable({
    groupName = groupName,
    group = {},
    margin = margin,
    _total_height = 0,
    font = love.graphics.newFont(font)
  },ButtonGroup);
end

function ButtonGroup:insert(button)
  self._total_height = self._total_height + (button.height + self.margin);
  table.insert(self.group , button);
end

function ButtonGroup:draw(ww,wh)
  local Cww = ww * 0.5;
  local Cwh = wh * 0.5;
  local cursor_y = 0
  local bx = 0;
  local by = 0;
  for i,button in ipairs(self.group) do
    button._last = button._now;
    bx = Cww - (button.width * 0.5);
    by = Cwh - (self._total_height  * 0.5) + cursor_y;

    local mx,my = love.mouse.getPosition();
    local isHover = mx > bx and mx < bx + button.width and
                    my > by and my < by + button.height;
    if isHover then
      love.graphics.setColor(unpack(button.hoverColor));
    else
      love.graphics.setColor(unpack(button.bgColor));
    end

    button._now = love.mouse.isDown(1);
    if button._now and not button._last and isHover then
      button.callback();
    end
    love.graphics.rectangle("fill",
      bx,
      by,
      button.width,
      button.height,
      button.borderRadiusX,
      button.borderRadiusY
    );

    love.graphics.setColor(unpack(button.textColor));
    local textW = self.font:getWidth(button.text);
    local textH = self.font:getHeight(button.text);
    love.graphics.print(
      button.text,
      self.font,
      (ww * 0.5) - textW * 0.5,
      by + textH * 0.5
    )
    cursor_y = cursor_y + (button.height + self.margin);
  end
end


return ButtonGroup;
