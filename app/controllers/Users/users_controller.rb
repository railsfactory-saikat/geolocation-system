# frozen_string_literal: true

module Users
  class UsersController < ApplicationController
    # GET /users/generate_token
    def generate_token
      user = User.find_by(email: params[:email])
      if user&.valid_password?(params[:password])
        token = JsonAuthorizationToken.encode(user_id: user.id)
        render json: { token: token }
      else
        render json: { error: "unauthorized access denied!" }, status: :unauthorized
      end
    end
  end
end
