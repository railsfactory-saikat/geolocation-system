# frozen_string_literal: true

class Geolocation < ApplicationRecord
  belongs_to :user
  has_one :location, dependent: :destroy
  validates :ip, presence: true, uniqueness: true
end
