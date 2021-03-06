function makeNormalDistribution(mean , sd)
	nor_table = {}	
	temp = 0.0
	sum_temp = 0.0
	--print ("nor table : " ,mean , sd)
	for r=0,99 do
		nor_table[r] = {}
		temp = (1.0 / (sd * 2.506628) ) * math.exp(-((r - mean)*(r - mean)) / (2 * sd * sd))
		sum_temp = sum_temp + temp
		nor_table[r][0] = temp
		nor_table[r][1] = sum_temp
		nor_table[r][2] = 1.0 - sum_temp
	end
	return nor_table
end

function cdfmin_id(data_array)
	sum = 0
	count = 0
	for i, v in ipairs(data_array) do
	   sum = sum + v
	   count = count + 1
	   --print ("\tv" , v)
	end
	mean = 100.0 / count
	sd = 16.0
	if count > 2 and count <= 50 then
		sd = sd - (count * 0.229)
	else
		sd = 4
	end
	nor_table = makeNormalDistribution(50 , sd)

	min_id = ""
	min_accu = 1.0
	distance_mean = 0.0
	nor = sum / 100

	if #nor_table > 0 then
		temp_min = 0.0
		
		for i in pairs(data_array) do
			row_index = math.floor((data_array[i] / nor) + 50 -mean+0.5)
			nor_value = (data_array[i] / nor)
			if row_index > 99 then
				row_index = 99
			end
			if row_index < 0 then
				row_index = 0
			end
			if distance_mean < math.abs(nor_value - mean) then
				distance_mean = math.abs(nor_value - mean) 
				min_id = i
				--print (" :::::" , min_id , ":" , nor_value)
				
				if nor_table[row_index][1] > nor_table[row_index][2] then
					min_accu = nor_table[row_index][2]
				else
					min_accu = nor_table[row_index][1]
				end
			end
					
			--print ("\trow_index : ", i  , data_array[i] / nor , ":" , mean , ":" , row_index)
		end	
	else
		min_accu = 1.0
	end
	
	--print("IN lua : ")
	--print(min_id , 1.0 - min_accu)
	return min_id, 1.0 - min_accu
end


function significant_id(a)
	val = a:getChildrenValue(1);
	id,value = cdfmin_id(val)
	id_array = a:getChildrenId();
	a:assign(0 , id_array[id])
	--print ("cdfmin_id : " , id , " : " , value)
	return true
end
