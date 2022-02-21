# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # POST /users
    def create
      user = User.new(user_params)
      if user.save
        render json: { status: "User created successfully." }
      else
        render json: { status: "failed! #{user.errors.full_messages.to_sentence}" }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
