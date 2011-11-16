require 'json'

#

# A traditional Ruby Hash
ruby_data = {:a => 1}

# It is easily converted to JSON
json_data = ruby_data.to_json

# Here the JSON is converted back to a Ruby hash
refried_data = JSON.parse(json_data)

puts %{
================================================================================
  
  Ruby:
  
  #{ruby_data}

  to JSON:
  
  #{json_data}
  
  
  JSON to Ruby
  
  #{refried_data}

  Notice that the returning JSON data will not have the symbol 
  value for the key:

  #{ruby_data} #{ruby_data == refried_data ? "=" : "!="} #{refried_data}
  
  The following are not equal because the keys are different. If 
  we had started with String keys instead of Symbols they would have 
  been the same.

================================================================================
}