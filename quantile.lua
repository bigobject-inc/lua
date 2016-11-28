function quantile(a, percentage)
        data_array = a:getChildrenValue(1);
        table.sort(data_array)
        index = (#data_array)*percentage
--      print("index:",index)
--      print("index:",#data_array)
--      print (data_array[index])
        a:assign(0,data_array[index])
        return true
end
