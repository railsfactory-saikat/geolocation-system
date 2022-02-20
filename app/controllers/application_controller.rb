# frozen_string_literal: true

class ApplicationController < ActionController::API
  protected

  def authenticate_user
    token = request.headers["Authorization"]
    token = token.split(" ").last if token
    begin
      decoded_token = JsonAuthorizationToken.decode(token)
      User.find(decoded_token[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  alias current_user authenticate_user

  def formatted_url(ip_address)
    "#{ENV['service_provider_url']}/#{ip_address}?access_key=#{ENV['access_key']}"
  end
end
