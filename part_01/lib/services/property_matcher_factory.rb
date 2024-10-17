# frozen_string_literal: true

class PropertyMatcherFactory
  def self.for(agency_property, database_property)
    case agency_property.agency_code
    when "OTBRE"
      OtbreMatcher.new(agency_property, database_property)
    when "LRE"
      LreMatcher.new(agency_property, database_property)
    else
      raise NotImplementedError, "There is no known matcher for this property's agency code"
    end
  end
end
