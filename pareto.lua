function nBinPercent(data_array , npercent)
	npercent = npercent / 100
	sum = 0.0
	for i,v in ipairs(data_array) do
		sum = sum + v
	end
	--print ("percent : " , npercent , " sum : " , sum)

	check_size = npercent * #data_array	
	table.sort(data_array ,  function(a,b) return a>b end)
	temp_sum = 0.0
	for i = 1, math.floor(check_size) do
		--print (data_array[i])
		temp_sum = temp_sum + data_array[i]
	end
	
	--print ("sum : " , sum , " check_size : " , check_size , "temp_sum : " , temp_sum )
	return temp_sum / sum
end

function pareto(a ,threshold,  percent )
	sv = a:getChildrenValue(1);
	value = nBinPercent(sv , percent)
	--print(value)
	a:assign(0 , value)
	if value > (threshold / 100) then
		return true
	else
		return false
	end

end
