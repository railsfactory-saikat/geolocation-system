# frozen_string_literal: true

require "rails_helper"

RSpec.describe Location, type: :model do
  let(:user) { create(:user) }
  let(:geolocation) { create(:geolocation, user: user) }
  let(:geoname_id) { Faker::Number.number(digits: 7) }

  context "when create Location with valid credentials" do
    it "creates location" do
      location = described_class.new(geoname_id: geoname_id, geolocation: geolocation)
      location.valid?
      expect(location.errors.any?).to eq(false)
    end
  end

  context "when create Location with invalid credentials" do
    it "doesn't create user" do
      location = described_class.new
      location.valid?
      expect(location.errors.any?).to eq(true)
      expect(location.errors.full_messages).to eq(["Geolocation must exist", "Geoname can't be blank"])
    end
  end
end
