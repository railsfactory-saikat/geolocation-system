# frozen_string_literal: true

require "rails_helper"

RSpec.describe Geolocation, type: :model do
  let(:user) { create(:user) }
  let(:ip_address) { Faker::Internet.ip_v4_address }

  context "when create Geolocation with valid credentials" do
    it "creates geolocation" do
      geolocation = described_class.new(ip: ip_address, user: user)
      geolocation.valid?
      expect(geolocation.errors.any?).to eq(false)
    end
  end

  context "when create Geolocation with invalid credentials" do
    it "doesn't create user" do
      geolocation = described_class.new
      geolocation.valid?
      expect(geolocation.errors.any?).to eq(true)
      expect(geolocation.errors.full_messages).to eq(["User must exist", "Ip can't be blank"])
    end
  end
end
