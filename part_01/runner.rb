# frozen_string_literal: true

require "yaml"
require_relative "lib/loader"

input = Psych.safe_load_file("data/input.yml")

h = input["agency_property"]
agency_property = Property.new(h["address"], h["agency_code"], h["name"], h["latitude"], h["longitude"])

h = input["database_property"]
db_property = Property.new(h["address"], h["agency_code"], h["name"], h["latitude"], h["longitude"])

puts "PROPERTY MATCHER"
puts "========================================================================================="
puts "Agency Property:"
puts agency_property.full_address
puts ""
puts "Database Property:"
puts db_property.full_address
puts ""

puts "Result: #{PropertyMatcher.is_match(agency_property, db_property) ? "MATCH" : "NO MATCH"}"

puts ""
puts "To compare a different property, please supply the relevant details in data/input.yml and rerun this script. Bye!"
