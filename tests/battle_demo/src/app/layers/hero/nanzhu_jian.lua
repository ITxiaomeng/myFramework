local Hero = require("src/app/layers/hero/Hero")


local nanzhu_jian = class("nanzhu_jian", Hero)

function nanzhu_jian:create( params )
	return nanzhu_jian.new(params)
end

function nanzhu_jian:getNeedMoveAtk( )
	return true
end

function nanzhu_jian:getDis( )
	return 200
end


return nanzhu_jian