function summary(a, type)
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
	if type == "\"sum\"" then a:assign(0 , sum) end
	if type == "\"count\"" then a:assign(0 , count) end
	if type == "\"max\"" then a:assign(0 , max) end
	if type == "\"min\"" then a:assign(0 , min) end
	if type == "\"mean\"" then a:assign(0 , mean) end
	if type == "\"sd\"" then a:assign(0 , sd) end
	return true
end
