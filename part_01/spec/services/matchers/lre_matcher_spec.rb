# frozen_string_literal: true

RSpec.describe LreMatcher do
  let(:agency_property_lat) { 37.9201 }
  let(:agency_property_lon) { 145.2364 }
  let(:database_property_lat) { 37.9285 }
  let(:database_property_lon) { 145.2526 }
  let(:agency_property) { Property.new(:addr, :agency_code, :name, agency_property_lat, agency_property_lon) }
  let(:database_property) { Property.new(:addr, nil, :name, database_property_lat, database_property_lon) }

  subject { described_class.new(agency_property, database_property) }

  describe "#meter_lat_diff" do
    it "returns the latitude difference in meters" do
      expected_distance = (agency_property_lat - database_property_lat).abs * LreMatcher::METER_PER_DEGREE
      expect(subject.meter_lat_diff).to eq(expected_distance)
    end
  end

  describe "#meter_lon_diff" do
    it "returns the longitude difference in meters" do
      expected_distance = (agency_property_lon - database_property_lon).abs * LreMatcher::METER_PER_DEGREE
      expect(subject.meter_lon_diff).to eq(expected_distance)
    end
  end

  describe "#lat_diff_within_range?" do
    it "respects the accuracy threshold" do
      allow(subject).to receive(:meter_lat_diff) { 199.5 }
      expect(subject.lat_diff_within_range?).to be_truthy

      allow(subject).to receive(:meter_lat_diff) { 202 }
      expect(subject.lat_diff_within_range?).to be_falsey
    end
  end

  describe "#lon_diff_within_range?" do
    it "respects the accuracy threshold" do
      allow(subject).to receive(:meter_lon_diff) { 199.5 }
      expect(subject.lon_diff_within_range?).to be_truthy

      allow(subject).to receive(:meter_lon_diff) { 202 }
      expect(subject.lon_diff_within_range?).to be_falsey
    end
  end

  describe "#match?" do
    it "is truthy when both latitude and longitude differences are within threshold" do
      allow(subject).to receive(:lat_diff_within_range?) { true }
      allow(subject).to receive(:lon_diff_within_range?) { true }
      expect(subject.match?).to be_truthy
    end

    it "is falsey when either names or addresses do not match" do
      allow(subject).to receive(:lat_diff_within_range?) { true }
      allow(subject).to receive(:lon_diff_within_range?) { false }
      expect(subject.match?).to be_falsey
    end
  end
end
