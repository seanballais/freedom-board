require 'yaml/store'

store =  YAML::Store.new "FreedomStore.yaml"

data1 = store.transaction {store[:name]}
data2 = store.transaction {store[:message]}

#Do something with data 1 and data 2 kun mayda man
#like to set values nira here
#data[:name]
#data[:message]


#stored
store.transaction do
	store [:name] = data1
	store [:message]= data2
	store ["Freedom Board"] = {"Stored" => "contents"}
	
	store.abort 
	store.commit
	store[:time_posted]= time.now
end