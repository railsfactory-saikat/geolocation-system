# frozen_string_literal: true

require "rails_helper"

describe GeolocationsController, type: :request do
  let(:user) { create(:user) }
  let(:token) { JsonAuthorizationToken.encode(user_id: user.id) }
  let(:ip_address) { Faker::Internet.ip_v4_address }

  # post /geolocations
  describe "# POST #geolocations with valid IP" do
    before do
      post "/geolocations", params: { ip: ip_address }, headers: { Authorization: "Bearer #{token}" }
    end

    it "Saves geolocation data" do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["status"]).to eq("Geolocation Saved successfully")
      expect(user.geolocations.first.ip).to eq(ip_address)
    end
  end

  describe "# POST #geolocations with invalid IP" do
    before do
      post "/geolocations", params: { ip: "192.18.1" }, headers: { Authorization: "Bearer #{token}" }
    end

    it "Saves geolocation data" do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "APIs of geolocations" do
    before do
      post "/geolocations", params: { ip: ip_address }, headers: { Authorization: "Bearer #{token}" }
    end

    # GET /geolocations
    describe "# GET #geolocations" do
      before do
        get "/geolocations", headers: { Authorization: "Bearer #{token}" }
      end

      it "makes list of user's geolocations" do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to eq(JSON.parse(user.geolocations.to_json))
      end
    end

    # GET /geolocations/:id
    describe "# GET #geolocations/:id" do
      before do
        get "/geolocations/#{user.geolocations.first.id}", headers: { Authorization: "Bearer #{token}" }
      end

      it "shows a geolocation details" do
        geolocation = GeolocationService.new(geo_id: user.geolocations.first.id, user: user).geolocation_data_formatter
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to eq(geolocation)
      end
    end

    # DELETE /geolocations/:id
    describe "# GET #geolocations/:id with valid id" do
      before do
        delete "/geolocations/#{user.geolocations.first.id}", headers: { Authorization: "Bearer #{token}" }
      end

      it "deletes a geolocation" do
        expect(response).to have_http_status(:success)
      end
    end

    describe "# GET #geolocations/:id with invalid id" do
      before do
        delete "/geolocations/100", headers: { Authorization: "Bearer #{token}" }
      end

      it "deletes a geolocation" do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["error"]).to eq("Record Not Found!")
      end
    end
  end
end
