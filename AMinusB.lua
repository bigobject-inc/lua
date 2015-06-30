function AMinusB(a , attr_a , attr_b)
	sv = a:getChildrenIdValue(1);
	a_v = 0
	b_v = 0
	for id,v in pairs(sv) do
		--print (id , v)
		if id == attr_a:sub(2,-2) then
			a_v = v
		end
		if id == attr_b:sub(2,-2) then
			b_v = v
		end	
	end
	value = (a_v - b_v)
	a:assign(0 , value)
	
	return true
end
