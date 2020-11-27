local Button = {};
Button.__index = Button;

function Button.new(text,callback,height,width
                    ,borderRadiusX,borderRadiusY
                    ,bgColor,textColor,hoverColor)
  return setmetatable({
    text = text,
    callback = callback,
    height = height,
    width = width,
    bgColor = bgColor,
    textColor = textColor,
    hoverColor = hoverColor,
    borderRadiusX = borderRadiusX or 0,
    borderRadiusY = borderRadiusY or 0,
    now = false,
    last = false
  },Button);
end

return Button;
