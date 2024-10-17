# frozen_string_literal: true

class BaseMatcher
  attr_accessor :agency_property, :database_property

  def initialize(agency_property, database_property)
    @agency_property = agency_property
    @database_property = database_property
  end

  def match?
    raise NotImplementedError, "Must be implemented by the subclass"
  end
end
