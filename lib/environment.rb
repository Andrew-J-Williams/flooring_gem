require 'open-uri'
require 'pry'
require 'nokogiri'

require_relative "./flooring_gem/version"
require_relative "./flooring_gem/cli"
require_relative "./flooring_gem/scraper"
require_relative "./flooring_gem/inventory"

module FlooringGem
  class Error < StandardError; end
  # Your code goes here...
end
