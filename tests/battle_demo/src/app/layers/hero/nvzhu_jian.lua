local nvzhu_jian = class("nvzhu_jian", Hero)

function nvzhu_jian:create( params )
	return nvzhu_jian.new(params)
end

function nvzhu_jian:getNeedMoveAtk( )
	return true
end

function nvzhu_jian:getDis( )
	return 200
end

return nvzhu_jian