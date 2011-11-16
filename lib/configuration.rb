#
# YAML is included with Ruby you have to require it in your project to make it work.
# 
require 'yaml'

YML_DATA = %{
development:
  bucket: MY-BUCKET-NAME
  access_key_id: ACCESS-KEY-ID
  secret_access_key: SECRET-ACCESS-KEY
}

loaded_yml_data = YAML::load(YML_DATA)

#
# You can use OpenStruct to capture the Hash of data
# 
require 'ostruct'

config = OpenStruct.new loaded_yml_data["development"]


puts %{
================================================================================
  
  When the data is parsed by YML it is turned into a Hash
  
  #{loaded_yml_data.class}

  #{loaded_yml_data["development"]}
  
  Bucket Name: #{loaded_yml_data["development"]["bucket"]}
  
  OStruct Bucket: #{config.bucket}

================================================================================}

#
# Data can also be converted to YML
# 
puts %{
================================================================================
  
  Converting to YML is easy as well after you require 'yml':
  
  #{[1, 2, 3].to_yaml}

  #{ { :a => 1 }.to_yaml}
  
================================================================================}



#
# This is an example of a more complicated way of loading configuration data
# from YML. The only values that should be loaded are those that match the 
# attr_accessors for the `Configuration` class.
# 
class Configuration
  
  def self.load(environment,filename)
    
    configuration = Configuration.new
    
    if File.exists? filename
    
      if environment = YAML::load(File.open(filename))[environment]
        
        environment.each do |setting,value|
          
          if configuration.respond_to? "#{setting}="
            configuration.send("#{setting}=",value)
          else
            puts "WARNING: environment configuration contains a setting (#{setting}) not mainained by the Configuration."
          end

        end
        
      else
        puts "WARNING: environment does not exist in configuration file"
      end
      
    else
      puts "WARNING: configuration file does not exist"
    end
    
    configuration
    
  end
  
  attr_accessor :bucket, :access_key_id, :secret_access_key
  
end

#
# Example usage:
# 
# configuration = Configuration.load('test',"YML file")