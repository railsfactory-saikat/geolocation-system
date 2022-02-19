# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # POST /users
    def create
      user = User.new(user_params)
      render json: user.save ? "User created successfully." : "User creation failed!"
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
