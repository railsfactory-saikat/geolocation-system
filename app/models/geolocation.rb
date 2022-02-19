# frozen_string_literal: true

class Geolocation < ApplicationRecord
  belongs_to :user
  validate :ip, presence: true, uniqueness: true
end
