#
# Reference:
# https://github.com/burtlo/happymapper
# 
# gem install unhappymapper
# 

require 'happymapper'

EXAMPLE_XML = %{
  <address>
    <street>Milchstrasse</street>
    <housenumber>23</housenumber>
    <postcode>26131</postcode>
    <city>Oldenburg</city>
    <country code="de">Germany</country>
  </address>
}

class Address
  include HappyMapper

  tag 'address'
  element :street, String
  element :postcode, String
  element :housenumber, Integer
  element :city, String
  element :country, 'Country'
end

class Country
  include HappyMapper
  
  tag 'country'
  
  attribute :code, String
  text_node :name, String
end

address = Address.parse(EXAMPLE_XML,:single => true)

puts %{
================================================================================

 As a Ruby object:
 
 #{address.street}
 #{address.postcode}
 #{address.housenumber}
 #{address.city}
 #{address.country.name} (#{address.country.code})
 
 Back to XML:
 
 #{address.to_xml}

================================================================================
}

