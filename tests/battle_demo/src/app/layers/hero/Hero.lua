Hero = class("Hero", cc.Node)

ACT_NAME = {
	IDLE = "idle",
	DEATH = "dead",
	ATK = "atk",
	ATK0 = "atk0",
	ATK3 = "atk3",
	DEFENCE = "atkd"
}

HERO_SIDE = {
	LEFT = 1,
	RIGHT = 2
}

HERO_ZORDER = {
	INITZORDER = 1,
	ACTZORDER = 10,
}

-- 创建人物
function Hero:createWithParams( params )
	local fileName = params.fileName
	local path = "src/app/layers/hero/"..fileName..".lua"
	return require(path):create(params)
end

function Hero:ctor( params )
	self.armature = sf.createArmature({   -- 记录人物骨骼
		parentPath = "res/hero/",
		fileName = params.fileName,
		actName = "idle",
		loop = true,
		})
	if params.flip and params.flip == true then   -- 是否需要翻转
		self.armature:setScaleX(self.armature:getScale() * -1)
	end

	if params.side then   -- 是左边的还是右边的
		self.side = params.side
	end
	self:addChild(self.armature)

	local armatureAnimation = self.armature:getAnimation()
	local function animationEvent(armatureBack,movementType,movementID)    -- 动作播放回调
		if movementType == ccs.MovementEventType.start then
    		
    	elseif movementType == ccs.MovementEventType.complete then
    		if movementID ~= ACT_NAME.IDLE then
    			if armatureBack	then
    				armatureBack:getAnimation():play(ACT_NAME.IDLE, -1)
    			end
    		end
		end
    end

    armatureAnimation:setMovementEventCallFunc(animationEvent)

    armatureAnimation:setFrameEventCallFunc(function ( bone, evt, originFrameIndex, currentFrameIndex)   -- 帧事件回调
    	self:_doAnimationEvent(evt)
    end)
end

-- 是否需要移动
function Hero:getNeedMoveAtk( actName )
	local ret = false
	if actName == ACT_NAME.ATK then
	
	elseif actName == ACT_NAME.ATK0 then
	
	elseif actName == ACT_NAME.ATK3 then

	end
	return false
end
-- event回调
function Hero:_doAnimationEvent( evt )
	print("event 回调:"..evt)
	if evt == "back" then
		if self.initPosX and self.initPosY then
			self:runAction(
				cc.Sequence:create(
				cc.MoveTo:create(0.2, cc.p(self.initPosX, self.initPosY)),
				cc.CallFunc:create(function ( )
					self:setLocalZOrder(HERO_ZORDER.INITZORDER)
					self.isPlaying = false
					self.target = nil
				end)
				))
		end
	end

	if string.find(evt, "atk") then
		local target = self:getTarget()
		if target then
			target:playAction(ACT_NAME.DEFENCE)
		end
	end
end
-- 攻击
function Hero:doAttack( params )
	if self.isPlaying then  -- 如果正在播放动画中，那就不要再执行一下函数
		return
	end
	local actName = params.actName
	local target = params.target
	self:setTarget(target)   -- 记录一下攻击目标目标， 在back后置空
	if self:getNeedMoveAtk(actName) then
		local side = self:getSide()
		local dis = 0
		if side == HERO_SIDE.LEFT then
			dis = -self:getDis()
		else
			dis = self:getDis()
		end
		self.initPosX = self:getPositionX()   -- 执行动作之前，初始化的位置
		self.initPosY = self:getPositionY()   
		self:runAction(
			cc.Sequence:create(
			cc.CallFunc:create(function( )
				self.isPlaying = true
				self:setLocalZOrder(HERO_ZORDER.ACTZORDER)
			end),
			cc.MoveTo:create(0.2, cc.p(target:getPositionX() + dis, target:getPositionY())),
			cc.CallFunc:create(function() 
					self:playAction(actName)
				end)
			))
	end
end
-- 设置armature
function Hero:setArmature( armature )
	self.armature = armature
end
-- 获取armature
function Hero:getArmature( )
	return self.armature
end

-- 执行动作
function Hero:playAction( actName )
	local loop = 1
	if actName == ACT_NAME.IDLE then
		loop = -1
	end
	self.armature:getAnimation():play(actName, loop)
end

-- 获取是哪一边的
function Hero:getSide( )
	return self.side
end

function Hero:setTarget( target )
	self.target = target
end

function Hero:getTarget( )
	return self.target
end

function Hero:create( params )
	return Hero:createWithParams(params)
end

return Hero
