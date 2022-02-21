# frozen_string_literal: true

require "rails_helper"

describe Users::UsersController, type: :request do
  let(:password) { Faker::Internet.password(min_length: 8) }
  let(:user) { create(:user, password: password) }

  describe "# GET #generate_token with correct details" do
    before do
      get "/generate_token", params: { email: user.email, password: password }
    end

    it "Generate Token" do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["token"]).to eq(JsonAuthorizationToken.encode(user_id: user.id))
    end
  end

  describe "# GET #generate_token with incorrect details" do
    before do
      get "/generate_token", params: { email: user.email, password: "password" }
    end

    it "Throws unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)["error"]).to eq("unauthorized access denied!")
    end
  end
end
