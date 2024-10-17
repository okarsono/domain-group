# frozen_string_literal: true

RSpec.describe CreMatcher do
  let(:agency_property_name) { "Apartments Summit The" }
  let(:database_property_name) { "The Summit Apartments" }
  let(:agency_property) { Property.new(:addr, :agency_code, agency_property_name, 1.0, 1.0) }
  let(:database_property) { Property.new(:addr, nil, database_property_name, 1.0, 1.0) }

  subject { described_class.new(agency_property, database_property) }

  describe "#match?" do
    it "is truthy when the reversed name of the property matches that of the database property" do
      expect(subject.match?).to be_truthy
    end

    context "when the reversed name does not match that of the database property" do
      let(:agency_property_name) { "Amazon" }
      let(:database_property_name) { "nozamA" }

      it "is falsey" do
        expect(subject.match?).to be_falsey
      end
    end
  end
end
