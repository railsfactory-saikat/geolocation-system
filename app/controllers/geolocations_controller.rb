# frozen_string_literal: true

class GeolocationsController < ApplicationController
  require "open-uri"

  def list
    render json: JSON.parse(URI.parse(formatted_url(params[:ip])).read)
  end
end
