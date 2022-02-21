# frozen_string_literal: true

class GeolocationsController < ApplicationController
  require "open-uri"
  before_action :authenticate_user

  # POST /geolocations
  def create
    if find_geolocation_data[:success] != false
      result = GeolocationService.call(params: params, geolocation_data: find_geolocation_data, user: current_user)
      render json: { status: status_msg(result), geolocation_data: find_geolocation_data }, status: status_code(result)
    else
      render json: { error: find_geolocation_data[:error][:info] }, status: :unprocessable_entity
    end
  end

  # GET /geolocations
  def index
    render json: current_user.geolocations
  end

  # GET /geolocations/:id
  def show
    render json: GeolocationService.new(geo_id: params[:id], user: current_user).geolocation_data_formatter
  end

  # DELETE /geolocations/:id
  def destroy
    geolocation = current_user.geolocations.find_by(id: params[:id])
    if geolocation.present?
      geolocation.destroy
      render json: { success: "Geolocation #{geolocation.id} deleted successfully" }
    else
      render json: { error: "Record Not Found!" }, status: :unprocessable_entity
    end
  end

  private

  def find_geolocation_data
    geo_data = JSON.parse(URI.parse(formatted_url(params[:ip])).read).deep_symbolize_keys
    geo_data[:ip_type] = geo_data.delete :type
    geo_data
  end

  def status_msg(result)
    result.success? ? "Geolocation Saved successfully" : "Failed to save the Geolocation"
  end

  def status_code(result)
    result.success? ? :ok : :unprocessable_entity
  end
end
