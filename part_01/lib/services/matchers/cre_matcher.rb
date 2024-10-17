# frozen_string_literal: true

class CreMatcher < BaseMatcher
  def match?
    reversed_agency_property_name == database_property.name
  end

  def reversed_agency_property_name
    agency_property.name.split(" ").reverse.join(" ")
  end
end
