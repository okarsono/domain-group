# frozen_string_literal: true

class PropertyMatcher
  # @param [Property] agency_property
  # @param [Property] database_property
  # @return [Boolean]
  def self.is_match(agency_property, database_property)
    PropertyMatcherFactory.for(agency_property, database_property).match?
  end
end
