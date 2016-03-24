function stringToHist(str)
	hist_table = {}	
        for i=1,256 do hist_table[i] = 0 end
        
	for idx = 1, string.len(str) do
                --print ("str ", str , ":" , string.byte(str,idx))
		hist_idx = string.byte(str,idx)
		hist_table[hist_idx] = hist_table[hist_idx] + 1
	end

	return hist_table
end

function similarity(hist1, hist2)
	sim = 0
 	for i=1,256 do 
               -- print(hist1[i] , ": " , hist2[i])
                if hist1[i] ~= nil and hist2[i] ~= nil then
		       sim = sim + math.min(hist1[i] , hist2[i] ) 
                end
	end
	return sim
end


function strinter(str_col, str,...)
	tab1 = stringToHist(str)
	tab2 = stringToHist(str_col)
	local arg={...}
	if arg[1] ~= nil then
		if arg[1] == "count" then
			return similarity(tab1,tab2)
		elseif arg[1] == "norm1" then
			return similarity(tab1,tab2) / string.len(str)
		elseif arg[1] == "norm2" then
			return similarity(tab1,tab2) / (string.len(str_col) * string.len(str))
		end
	end

	return similarity(tab1,tab2)
end
