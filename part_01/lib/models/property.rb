# frozen_string_literal: true

class Property
  attr_accessor :address, :agency_code, :name, :latitude, :longitude

  # @param [String] address
  # @param [String] agency_code
  # @param [String] name
  # @param [Float] latitude
  # @param [Float] longitude
  def initialize(address, agency_code, name, latitude, longitude)
    @address = address
    @agency_code = agency_code
    @name = name
    @latitude = latitude
    @longitude = longitude
  end
end
