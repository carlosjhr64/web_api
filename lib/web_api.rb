# Standard Libraries
require 'net/http'
require 'cgi'

# External Gems
require 'crstruct'

# This Gem
module WEB_API
  VERSION = '1.0.210926'
  require_relative 'web_api/web_api_method.rb'
  require_relative 'web_api/web_api.rb'
end

# Requires:
#`ruby`
