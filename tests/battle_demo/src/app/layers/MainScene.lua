local MainScene = class("MainScene", SceneBase)
require("src/app/layers/hero/Hero")
local BattleLayer = require("src/app/layers/battle/BattleLayer")

function MainScene:create( params )
	return MainScene.new(params)
end

function MainScene:ctor( params )
	self:initData(params)
	self:initUI()
end

function MainScene:initData( params )
	
end

function MainScene:initUI()
	-- print("initUI----")
	-- local actTable = {
	-- 	"atk",
	-- 	"atk0",
	-- 	"atk3"
	-- }
	-- local index = 1
	-- local label = sf.createLabel({
	-- 	text = "aaaa",
	-- 	pos = cc.p(display.cx + 200, display.cy),
	-- 	parent = self,
	-- 	fontSize = 35,
	-- 	listener = function ( sender, eventType )
	-- 		if eventType == ccui.TouchEventType.ended then
 --        		index = index + 1
 --        		if index > #actTable then
 --        			index = 1
 --        		end
 --        		if self.armature then
 --        			self.armature:playAction(actTable[index], index == 1 and -1 or 1)
 --        		end
 --           	end
	-- 	end
	-- 	})

	-- local label2 = sf.createLabel({
	-- 	text = "dddd",
	-- 	pos = cc.p(display.cx + 200, display.cy - 100),
	-- 	parent = self,
	-- 	fontSize = 35,
	-- 	listener = function ( sender, eventType )
	-- 		if eventType == ccui.TouchEventType.ended then
 --        		index = index + 1
 --        		if index > #actTable then
 --        			index = 1
 --        		end
 --        		if self.armature then
 --        			self.armature:playAction(ACT_NAME.DEFENCE)
 --        		end
 --           	end
	-- 	end
	-- 	})
	-- local nanjian = Hero:create({
	-- 	fileName = "nanzhu_jian"
	-- 	})
	-- self.armature = nanjian
	-- nanjian:setPosition(cc.p(display.cx, display.cy))
	-- self:addChild(nanjian)


	-- local arm = sf.createArmature({
	-- 	parentPath = "res/hero/",
	-- 	fileName = "nanzhu_jian",
	-- 	actName = "idle",
	-- 	loop = true,
	-- 	})
	-- self.armature = arm
	-- arm:setPosition(cc.p(display.cx, display.cy))
	-- self:addChild(arm)

	-- local armatureAnimation = arm:getAnimation()
	-- local function animationEvent(armatureBack,movementType,movementID)
	-- 	if movementType == ccs.MovementEventType.start then
    		
 --    	elseif movementType == ccs.MovementEventType.complete then
 --    		if movementID ~= EVENT_NAME.IDLE then
 --    			if armatureBack	then
 --    				armatureBack:getAnimation():play(EVENT_NAME.IDLE, -1)
 --    			end
 --    		end
	-- 	end
 --    end

 --    armatureAnimation:setMovementEventCallFunc(animationEvent)
 	local battleLayer = BattleLayer:create({
 		left = {
 			fileName = "nanzhu_jian",
 		},
 		right = {
 			fileName = "nvzhu_jian",
 		}
 		})
 	self:addChild(battleLayer)

end

return MainScene