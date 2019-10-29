require 'open-uri'
require 'pry'
require 'nokogiri'

require_relative "./flooring_gem/version"
require_relative "./flooring_gem/cli"
require_relative "./flooring_gem/scraper"
require_relative "./flooring_gem/inventory"
require_relative "./flooring_gem/site_scraper"
require_relative "./flooring_gem/city"
require_relative "./flooring_gem/products"

module FlooringGem
  class Error < StandardError; end
  # Your code goes here...
end
