# Examples

The following project has some basic examples that showcase the following functionality:

### YAML

[YAML](http://yaml.org/YAML_for_ruby.html) is the standard configuration format for Rails applications.

* Run the rake task `rake yaml`

### JSON

* Run the rake task `rake json`

### XML

Parsing XML is often difficult because of how complicated it can be shaped. A tool that I have found immensely useful for both translating to and from XML is `Happymapper`.

The [fork](https://github.com/burtlo/happymapper) of the happymapper project that I maintain contains more examples in the README documentation.

* Run the rake task `rake xml`

### Geocoder

This great gem will attach automatically to your Sinatra application. To get it to work though you cannot use the traditional host and port `localhost:4567` or `127.0.0.1:4567`. You will have to find out your IP address and use that when testing locally.

Visit [icanhazip](http://icanhazip.com/) or even [rubygeocoder](http://www.rubygeocoder.com/) to find out your IP address to use for testing.

* Run the rake task `rake geocoder`

### Amazon Bit Bucket Services

Heroku does not allow you to store files locally so you will often have to employ Amazon Web Services as your file support if you want to write to or read from a file. It's actually much easier than one might expect. The hardest part is setting up your Amazon Web Services account and creating a `Bucket` to store your file data.

    Amazon does in fact charge for their services, however, the amount that
    you may use for testing is likely to charge you nothing or pennies.


* Create an [Amazon Web Services Account](http://aws.amazon.com/)
* Find the following data that you need to place in a `s3.yml`

    development:
      bucket: BUCKET_NAME
      access_key_id: ACCESS_KEY_ID
      secret_access_key: SECRET_KEY_ID
      
* Run the rake task `rake amazon`
* Check your [Amazon Web Services Console](https://console.aws.amazon.com/s3/home) to see the file that was created.

### RMagick (powered by Imagemagick)

RMagick requires Imagemagick. For MAC users it is likely easiest to install it through `homebrew` with `brew install imagemagick`.

Imagemagick allows you to some some amazing things with images.

* Install imagemagick
* Run the rake task `rake image`
