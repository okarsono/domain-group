# frozen_string_literal: true

RSpec.describe PropertyMatcher do
  describe "::is_match" do
    let(:database_property_name) { "The Summit Apartment" }
    let(:database_property_address) { "32 Sir John Young Crescent, Sydney NSW" }
    let(:database_property_lat) { 33.8568 }
    let(:database_property_lon) { 151.2153 }
    let(:database_property) do
      Property.new(database_property_address, nil, database_property_name, database_property_lat, database_property_lon)
    end
    let(:agency_property) { Property.new(address, agency_code, property_name, latitude, longitude) }

    subject { described_class.is_match(agency_property, database_property) }

    context "property under OTBRE" do
      let(:agency_code) { "OTBRE" }
      let(:property_name) { "Sydney Opera House" }
      let(:address) { "32 Sir John-Young Crescent, Sydney, NSW" }
      let(:latitude) { database_property_lat }
      let(:longitude) { database_property_lon }

      context "matches only based on the name and address attributes" do
        context "when they dont match" do
          it "is falsey" do
            expect(subject).to be_falsey
          end
        end

        context "when they match" do
          let(:property_name) { database_property_name.gsub(/ /, "-%") }

          it "is truthy" do
            expect(subject).to be_truthy
          end
        end
      end
    end

    context "property under LRE" do
      let(:agency_code) { "LRE" }
      let(:property_name) { database_property_name }
      let(:address) { database_property_address }
      let(:latitude) { database_property_lat + 0.0017 }
      let(:longitude) { database_property_lon - 0.0018 }

      context "matches only based on proximity to the target's GPS coordinates" do
        context "when they are within threshold" do
          it "is truthy" do
            expect(subject).to be_truthy
          end
        end

        context "when they are outside threshold" do
          let(:latitude) { database_property_lat + 0.0019 }

          it "is falsey" do
            expect(subject).to be_falsey
          end
        end
      end
    end

    context "property under CRE" do
      let(:agency_code) { "CRE" }
      let(:property_name) { "Apartment Summit The" }
      let(:address) { database_property_address }
      let(:latitude) { database_property_lat }
      let(:longitude) { database_property_lon }

      context "matches only based on the name" do
        context "when the words in the names are mirrored" do
          it "is truthy" do
            expect(subject).to be_truthy
          end
        end

        context "when the words in the names are not mirrored" do
          let(:property_name) { "Summit The Apartment" }

          it "is falsey" do
            expect(subject).to be_falsey
          end
        end
      end
    end
  end
end
