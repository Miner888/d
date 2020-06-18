local y = 10
local x = 10
local x1 = 10
local y1 = 10
local x2 = 10
local y2 = 10
local speed = 1600
local sound
local mouseX = 0
local mouseY = 0
local image
local videostream

local ballX = 300
local ballY = 200
local ballYSpeed = 0
local ballXSpeed = 0
local limit = 30

local balls = {}

Ball = { x = 0, y = 0, yVelocity = 0, xVelocity = 0, size = 30 }

function Ball:new (o, x, y, size, color)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.x = x
  self.y = y or 0
  self.size = size or 0
  self.color = color or { r = math.random(), g = math.random(), b = math.random() }
  self.xVelocity = 0
  self.yVelocity = 0
  return o
end

function Ball:physics()

  self.color = self.color
  self.size = self.size
  self.x = self.x + self.xVelocity

  if self.yVelocity > 0 then
    self.y = self.y + self.yVelocity
    self.yVelocity = self.yVelocity - 0.2
    if self.yVelocity < 0.1 then
      self.yVelocity = 0
    end
  end

  if self.yVelocity < 0 then
    self.y = self.y + self.yVelocity
    self.yVelocity = self.yVelocity + 0.2
  end

  if self.y < (500 - (self.size / 2)) then
    self.yVelocity = self.yVelocity + 1
    if self.yVelocity > limit then
      self.yVelocity = limit
    end
  else
    self.yVelocity = -self.yVelocity
  end
end

function love.load()
--  videostream = love.video.newVideoStream("")
  sound1 = love.audio.newSource("Halloween.mp3", "static")
  image1 = love.graphics.newImage("Butterfly1.png")
  image = love.graphics.newImage("frog.png")
  sound = love.audio.newSource("shot.mp3", "static")
end
function love.draw()
--  love.graphics.draw(image2, x2, y2, 0, 0.99)
  love.graphics.draw(image1, mouseX, mouseY, 0, 0.01)
  love.graphics.draw(image1, x, y, 0, 0.02)
  love.graphics.draw(image, x1, y1, 0, 0.24)

  for k, v in ipairs(balls) do
    love.graphics.setColor(v.color.r, v.color.g, v.color.b, 1)
    love.graphics.circle("fill", v.x, v.y, v.size)
  end

  --for ball in balls do
    --
  --end
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("fill", 0, 500, 1000, 2000)
end
function love.keypressed(key)
  if key == "m" then
    love.audio.play(sound1)
  end
end

  function love.mousepressed(x, y, button, isTouch)
    local newBall = Ball:new(nil, x, y, math.random(20, 50))
    table.insert(balls, newBall)
  end

function love.update(dt)

  for k, v in ipairs(balls) do
    v:physics()
  end
  if love.keyboard.isDown("f") then
    love.audio.play(sound)
  end
if love.keyboard.isDown("t") then
  love.audio.pause(sound)
end
if love.keyboard.isDown("t") then
  love.audio.pause(sound1)
end
  if love.keyboard.isDown("w") then
    y = y - speed * dt
  end
  if love.keyboard.isDown("s") then
    y = y + speed * dt
  end
  if love.keyboard.isDown("d") then
    x = x + speed * dt
  end
  if love.keyboard.isDown("a") then
    x = x - speed * dt
  end
  if love.keyboard.isDown("up") then
    y1 = y1 - speed * dt
  end
  if love.keyboard.isDown("down") then
    y1 = y1 + speed * dt
  end
  if love.keyboard.isDown("right") then
    x1 = x1 + speed * dt
  end
  if love.keyboard.isDown("left") then
    x1 = x1 - speed * dt
  end
  if love.keyboard.isDown("i") then
    y2 = y2 - speed * dt
  end
  if love.keyboard.isDown("k") then
    y2 = y2 + speed * dt
  end
  if love.keyboard.isDown("l") then
    x2 = x2 + speed * dt
  end
  if love.keyboard.isDown("j") then
    x2 = x2 - speed * dt
  end
 end
love.audio.setVolume(1)
