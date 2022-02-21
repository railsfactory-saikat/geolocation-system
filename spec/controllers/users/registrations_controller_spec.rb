# frozen_string_literal: true

require "rails_helper"

describe Users::RegistrationsController, type: :request do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }

  describe "# POST #users with valid input" do
    before do
      post "/users", params: { email: email, password: password }
    end

    it "user created successfully" do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["status"]).to eq("User created successfully.")
    end
  end

  describe "# POST #users with invalid input" do
    before do
      post "/users", params: { email: "email", password: password }
    end

    it "user creation failed" do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
