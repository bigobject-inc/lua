function summary(a, type)
	type_str = type
	if type ~= "1" and type ~= "2" and type ~= "3"  and type ~= "4" and type ~= "5"  and type ~= "6"  and type_str ~= "sum"  and type_str ~= "count"  and type_str ~= "max"  and type_str ~= "min"  and type_str ~= "mean"  and type_str ~= "sd"  then
		error("unknown summary type : " .. type )
	end

	print (type)
	data_array = a:getChildrenValue(1);
	
	sum = 0.0
	count = 0	
	for i,v in ipairs(data_array) do
		count = count + 1
		sum = sum + v
	end
	
	max = 0.0
	min = 0.0
	mean = sum / count
	sd = 0.0

	for i,v in ipairs(data_array) do
		if i == 1 then
			max = v
			min = v
		end
		--print (i,v)
		if(v > max) then
			max = v
		end
		if(v < min) then
			min = v
		end
		sd = sd + math.pow((v - mean),2) 
	end
	sd = math.sqrt(sd / count)
	
	print ("sum : " , sum , ", count : " , count , ", max : " , max , ", min : " , min )
	print ("mean : " , mean , ", sd : " , sd)
	
	print (type)
	if type == "1" then a:assign(0 , sum) end
	if type == "2" then a:assign(0 , count) end
	if type == "3" then a:assign(0 , max) end
	if type == "4" then a:assign(0 , min) end
	if type == "5" then a:assign(0 , mean) end
	if type == "6" then a:assign(0 , sd) end
--	type_str = type:sub(2,-2)
	if type_str == "sum" then a:assign(0 , sum) end
	if type_str == "count" then a:assign(0 , count) end
	if type_str == "max" then a:assign(0 , max) end
	if type_str == "min" then a:assign(0 , min) end
	if type_str == "mean" then a:assign(0 , mean) end
	if type_str == "sd" then a:assign(0 , sd) end
	return true
end
