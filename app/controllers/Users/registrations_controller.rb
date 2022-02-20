# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # POST /users
    def create
      user = User.new(user_params)
      message = user.save ? "User created successfully." : "failed! #{user.errors.full_messages.to_sentence}"
      render json: { status: message }
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
