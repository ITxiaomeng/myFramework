local BattleLayer = class("BattleLayer", cc.Layer)

function BattleLayer:create (params)
	return BattleLayer.new(params)
end

function BattleLayer:ctor( params )
	self:initData(params)
	self:initUI()
end

function BattleLayer:initData( params )
	self.left = params.left
	self.right = params.right
end

function BattleLayer:initUI( )
	if self.left then
		self.leftHero = Hero:create({
			fileName = self.left.fileName,
			flip = true,
			side = 1,
			})
		self.leftHero:setPosition(cc.p(200, display.cy + 100))
		self:addChild(self.leftHero)
	end

	if self.right then
		self.rightHero = Hero:create({
			fileName = self.right.fileName,
			side = 2,
			})
		self.rightHero:setPosition(cc.p(display.width - 200, display.cy + 100))
		self:addChild(self.rightHero)
	end


	local actTable = {
		"atk",
		"atk0",
		"atk3"
	}
	local index = 0
	local label = sf.createLabel({
		text = "aaaa",
		pos = cc.p(display.cx - 200, display.cy),
		parent = self,
		fontSize = 35,
		listener = function ( sender, eventType )
			if eventType == ccui.TouchEventType.ended then
        		index = index + 1
        		if index > #actTable then
        			index = 1
        		end
        		if self.leftHero then
        			self.leftHero:doAttack({
        				actName = actTable[index],
        				target = self.rightHero
        				})
        		end
           	end
		end
		})
	local index2 = 0
	local label2 = sf.createLabel({
		text = "bbbb",
		pos = cc.p(display.cx + 200, display.cy),
		parent = self,
		fontSize = 35,
		listener = function ( sender, eventType )
			if eventType == ccui.TouchEventType.ended then
        		index2 = index2 + 1
        		if index2 > #actTable then
        			index2 = 1
        		end
        		if self.rightHero then
        			self.rightHero:doAttack({
        				actName = actTable[index2],
        				target = self.leftHero
        				})
        		end
           	end
		end
		})

end

return BattleLayer