# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }

  context "when create User with valid credentials" do
    it "creates user" do
      user = described_class.new(email: email, password: password)
      user.valid?
      expect(user.errors.any?).to eq(false)
    end
  end

  context "when create User with invalid credentials" do
    it "doesn't create user" do
      user = described_class.new(email: "email", password: "1")
      user.valid?
      expect(user.errors.any?).to eq(true)
      expect(user.errors.full_messages).to eq(["Email is invalid", "Password is too short (minimum is 6 characters)"])
    end
  end
end
