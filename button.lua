local Button = {};
Button.__index = Button;

function Button.new(text,callback,height,width)
  return setmetatable({
    text = text,
    callback = callback,
    height = height,
    width = width,
    now = false,
    last = false
  },Button);
end

return Button;
