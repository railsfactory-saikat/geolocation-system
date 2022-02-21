# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :geolocation
  validates_presence_of :geoname_id
end
