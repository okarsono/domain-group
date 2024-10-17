# frozen_string_literal: true

class LreMatcher < BaseMatcher
  ACCURACY_THRESHOLD = 200.0
  METER_PER_DEGREE = 111_000

  def match?
    lat_diff_within_range? && lon_diff_within_range?
  end

  def lat_diff_within_range?
    meter_lat_diff <= ACCURACY_THRESHOLD
  end

  def lon_diff_within_range?
    meter_lon_diff <= ACCURACY_THRESHOLD
  end

  def meter_lat_diff
    (agency_property.latitude - database_property.latitude).abs * METER_PER_DEGREE
  end

  def meter_lon_diff
    (agency_property.longitude - database_property.longitude).abs * METER_PER_DEGREE
  end
end
