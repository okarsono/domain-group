# frozen_string_literal: true

class OtbreMatcher < BaseMatcher
  attr_reader :sanitised_name

  def match?
    match_name? && match_address?
  end

  def match_name?
    match_punctuationless_attribute?(:name)
  end

  def match_address?
    match_punctuationless_attribute?(:address)
  end

  def normalise(string)
    string.gsub(/[^A-Za-z0-9]/, "").downcase
  end

  private

  def match_punctuationless_attribute?(attribute_name)
    normalise(agency_property.send(attribute_name)) == normalise(database_property.send(attribute_name))
  end
end
