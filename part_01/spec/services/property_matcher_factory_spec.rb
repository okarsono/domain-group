# frozen_string_literal: true

RSpec.describe PropertyMatcherFactory do
  let(:agency_property) { double(agency_code: agency_code) }
  let(:database_property) { double }

  subject { described_class.for(agency_property, database_property) }

  describe "::for" do
    context "recognised agency code" do
      context "OTBRE" do
        let(:agency_code) { "OTBRE" }

        it "returns the correct matcher" do
          expect(subject).to be_instance_of OtbreMatcher
        end
      end

      context "LRE" do
        let(:agency_code) { "LRE" }

        it "returns the correct matcher" do
          expect(subject).to be_instance_of LreMatcher
        end
      end

      context "CRE" do
        let(:agency_code) { "CRE" }

        it "returns the correct matcher" do
          expect(subject).to be_instance_of CreMatcher
        end
      end
    end

    context "unrecognised agency code" do
      let(:agency_code) { "Base" }

      it "raises an error" do
        expect { subject }.to raise_error(NotImplementedError)
      end
    end
  end
end
