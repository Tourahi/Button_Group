local ButtonGroup = {};
ButtonGroup.__index = ButtonGroup;

function ButtonGroup.new(groupName,margin,font)
  print(margin)
  return setmetatable({
    groupName = groupName,
    group = {},
    margin = margin,
    total_height = 0,
    font = love.graphics.newFont(font)
  },ButtonGroup);
end

function ButtonGroup:insert(button)
  self.total_height = self.total_height + (button.height + self.margin);
  table.insert(self.group , button);
end

function ButtonGroup:draw(ww,wh)
  local Cww = ww * 0.5;
  local Cwh = wh * 0.5;
  local cursor_y = 0
  local bx = 0;
  local by = 0;
  for i,button in ipairs(self.group) do
    print("Current FPS: "..tostring(love.timer.getFPS( )));
    button.last = button.now;
    bx = Cww - (button.width * 0.5);
    by = Cwh - (self.total_height  * 0.5) + cursor_y;
    local bgColor = {0.49,0.49,0.49,1.0};
    local textColor = {0.0,0.0,0.0,1.0};
    local mx,my = love.mouse.getPosition();
    local isHover = mx > bx and mx < bx + button.width and
                    my > by and my < by + button.height;
    if isHover then
      bgColor = {1.0,1.0,0.9,1.0};
    end
    button.now = love.mouse.isDown(1);
    if button.now and not button.last and isHover then
      button.callback();
    end
    love.graphics.setColor(unpack(bgColor));
    love.graphics.rectangle("fill",
      bx,
      by,
      button.width,
      button.height
    );

    love.graphics.setColor(unpack(textColor));
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
