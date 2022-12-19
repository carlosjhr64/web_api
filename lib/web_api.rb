# Standard Libraries
require 'net/http'
require 'cgi'

# External Gems
require 'crstruct'

# This Gem
class WebApi
  VERSION = '1.0.221219'
  require_relative 'web_api/web_api_method.rb'
  require_relative 'web_api/web_api.rb'
end
# Requires:
#`ruby`
