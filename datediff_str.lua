function datediff_str(d, datestring1,...)
	--print(datestring1)
	
	col_date = os.time({year = d:year(), month = d:month(), day = d:day() , hour = d:hour(), min = d:minute(), sec = d:second() })
	date_pattern = "(%d+)%-(%d+)%-(%d+)% (%d+)%:(%d+)%:(%d+)"

	year1, mon1, day1, hour1, min1, sec1 = datestring1:match(date_pattern)
	if year1 == nil then
                date_pattern = "(%d+)%-(%d+)%-(%d+)"
                year1, mon1, day1 = datestring1:match(date_pattern)
                hour1 = 0
                min1 = 0
                sec1 = 0
        end

	str_date = os.time({year = year1, month = mon1, day = day1, hour = hour1, min = min1, sec = sec1 })
	
	local arg={...}
	if arg[1] ~= nil then
		if arg[1] == "min" then
			return math.abs((str_date - col_date) / 60)
		elseif arg[1] == "hour" then
			return math.abs((str_date - col_date) / 3600)
		elseif arg[1] == "day" then
			return math.abs((str_date - col_date) / 86400)
		end
	end
	return math.abs(str_date - col_date)
end
