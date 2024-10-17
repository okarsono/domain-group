# frozen_string_literal: true

require_relative "lib/loader"

db_property = Property.new("addr1", nil, "nama", 100, 50)
agency_property = Property.new("addr1", "OTBRE", "nama", 100, 50)
agency_property = Property.new("addr1", "LRE", "nama", 100, 50)


puts "Helloworld"

puts "are the two properties matching? #{PropertyMatcher.is_match(agency_property, db_property)}"
puts agency_property.agency_code
