function summary_all(a)
	data_array = a:getChildrenValue(0);

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
	
	--print ("sum : " , sum , ", count : " , count , ", max : " , max , ", min : " , min )
	--print ("mean : " , mean , ", sd : " , sd)
	
	--print (type)
	a:assign(1 , sum)
	a:assign(2 , count)
	a:assign(3 , max)
	a:assign(4 , min)
	a:assign(5 , mean)
	a:assign(6 , sd)


	return true
end
