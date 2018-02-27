require 'yaml/store'

Posts = Struct.new :message, :name

post = [Posts.new("HELLO!", "Anonymus")]

store =  YAML::Store.new "test.store"

store.transaction do
	store ["post"] = post
	store ["greeting"] = {"Stored" => "contents"}
end