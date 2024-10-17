# frozen_string_literal: true

RSpec.describe OtbreMatcher do
  let(:agency_property_name) { "*Super*-High! APARTMENTS (Sydney)" }
  let(:database_property_name) { "*Super*-High! APARTMENTS (Sydney)" }
  let(:agency_property_address) { "32 Sir John-Young Crescent, Sydney, NSW." }
  let(:database_property_address) { "32 Sir John Young Crescent, Sydney NSW" }
  let(:agency_property) { Property.new(agency_property_address, :agency_code, agency_property_name, 1.0, 1.0) }
  let(:database_property) { Property.new(database_property_address, nil, database_property_name, 1.0, 1.0) }

  subject { described_class.new(agency_property, database_property) }

  describe "#normalise" do
    it "strips all special characters out and convert to lowercase" do
      expect(subject.normalise(agency_property_name)).to eq("superhighapartmentssydney")
      expect(subject.normalise(database_property_name)).to eq("superhighapartmentssydney")
      expect(subject.normalise(agency_property_address)).to eq("32sirjohnyoungcrescentsydneynsw")
      expect(subject.normalise(database_property_address)).to eq("32sirjohnyoungcrescentsydneynsw")
    end
  end

  describe "#match_name?" do
    context "when the values match" do
      it "is truthy" do
        expect(subject.match_name?).to be_truthy
      end
    end

    context "when the values do not match" do
      let(:agency_property_name) { "So high apartments, sydney" }

      it "is falsey" do
        expect(subject.match_name?).to be_falsey
      end
    end
  end

  describe "#match_address?" do
    context "when the values match" do
      it "is truthy" do
        expect(subject.match_address?).to be_truthy
      end
    end

    context "when the values do not match" do
      let(:agency_property_address) { "32 Sir John-Young Crescent, Sydney" }

      it "is falsey" do
        expect(subject.match_address?).to be_falsey
      end
    end
  end

  describe "#match?" do
    it "is truthy when both names and addresses match" do
      allow(subject).to receive(:match_name?) { true }
      allow(subject).to receive(:match_address?) { true }
      expect(subject.match?).to be_truthy
    end

    it "is falsey when either names or addresses do not match" do
      allow(subject).to receive(:match_name?) { false }
      allow(subject).to receive(:match_address?) { true }
      expect(subject.match?).to be_falsey
    end
  end
end
