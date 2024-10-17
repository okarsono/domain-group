# frozen_string_literal: true

RSpec.describe Property, type: :model do
  let(:instance_attributes) { %w[address agency_code name latitude longitude] }

  subject { described_class.new(*instance_attributes) }

  it "has all necessary attributes" do
    %i[name agency_code address latitude longitude].each do |attribute|
      expect(subject.respond_to?(attribute)).to be_truthy
    end
  end

  it "returns its attributes correctly" do
    expect(subject.address).to eq "address"
    expect(subject.agency_code).to eq "agency_code"
    expect(subject.name).to eq "name"
    expect(subject.latitude).to eq "latitude"
    expect(subject.longitude).to eq "longitude"
  end
end
