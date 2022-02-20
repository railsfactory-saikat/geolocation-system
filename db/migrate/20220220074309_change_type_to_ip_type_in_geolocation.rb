# frozen_string_literal: true

class ChangeTypeToIpTypeInGeolocation < ActiveRecord::Migration[5.2]
  def change
    rename_column :geolocations, :type, :ip_type
  end
end
