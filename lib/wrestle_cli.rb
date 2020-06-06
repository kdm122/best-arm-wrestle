require 'bundler/setup'
Bundler.require(:default)

require 'net/http'
require 'open-uri'
require 'json'

require_relative './cli/cli.rb'
require_relative './cli/apiconnect.rb'
require_relative './cli/champion.rb'

