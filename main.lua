local Button = require "button";
local ButtonGroup = require "buttonGroup";
local ww = love.graphics.getWidth();
local wh = love.graphics.getHeight();
local strColor = { {0.49,0.49,0.49,1.0} -- bgColor
                  , {0.0,0.0,0.0,1.0}   -- text color
                  , {0.9,0.9,0.9,1.0}}  -- on hover color

function love.load(arg)
  mainBtns = ButtonGroup.new("main",16,32);
  -- Start btn
  mainBtns:insert(Button.new("Start",
    function()
      print("Start");
    end
  ,64,ww * (1/3),10,30
  ,unpack(strColor)));

  -- Save btn
  mainBtns:insert(Button.new("Load Save",
    function()
      print("Save");
    end
  ,64,ww * (1/3),20,20
  , {0.49,0.49,0.49,1.0}
  , {0.0,0.0,0.0,1.0}
  , {0.9,0.7,0.8,1.0}));

  --Exit btn
  mainBtns:insert(Button.new("Exit",
    function()
      love.event.quit(0);
    end
  ,64,ww * (1/3),50,20
  , {0.49,0.49,0.49,1.0}
  , {0.0,0.0,0.0,1.0}
  , {0.9,0.2,0.8,1.0}),55);
end

function love.update(dt)

end

function love.draw()
  love.graphics.setColor(0, 1, 0, 1);
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10);
  mainBtns:draw(ww,wh);
end
