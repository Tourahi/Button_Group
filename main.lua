local Button = require "button";
local ButtonGroup = require "buttonGroup";
local ww = love.graphics.getWidth();
local wh = love.graphics.getHeight();


function love.load(arg)
  mainBtns = ButtonGroup.new("main",16,32);
  mainBtns:insert(Button.new("Start",
    function()
      print("Start");
    end
  ,64,ww * (1/3)));
  mainBtns:insert(Button.new("Load Save",
    function()
      print("Save");
    end
  ,64,ww * (1/3)));
  mainBtns:insert(Button.new("Exit",
    function()
      love.event.quit(0);
    end
  ,64,ww * (1/3)));
end

function love.update(dt)

end

function love.draw()
  mainBtns:draw(ww,wh);
end
