require 'aws/s3'
require_relative 'configuration'

#
# Amazon S3 Reference
# 
# http://rubydoc.info/gems/aws-s3/0.6.2/frames

#
# You will need to create a `s3.yml` file which contains the following text:
# 
# development:
#   bucket: BUCKET_NAME
#   access_key_id: ACCESS_KEY_ID
#   secret_access_key: SECRET_KEY_ID
# 

settings = Configuration.load('development','s3.yml')

# This is the call to establish the connection to Amazon S3.

AWS::S3::Base.establish_connection! :access_key_id => settings.access_key_id,
    :secret_access_key => settings.secret_access_key

#
# Afterwards, you can create files in the Amazon S3 realm
# 

name_of_file_on_amazon = "README.md"
name_of_local_file = "README.md"

AWS::S3::S3Object.store name_of_file_on_amazon,
  File.open(name_of_local_file,'r'),
  settings.bucket,
  :access => :public_read