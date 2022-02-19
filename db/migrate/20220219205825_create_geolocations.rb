# frozen_string_literal: true

class CreateGeolocations < ActiveRecord::Migration[5.2]
  def change
    create_table :geolocations do |t|
      t.belongs_to :user, foreign_key: true
      t.string :ip, null: false, unique: true
      t.string :type
      t.string :continent_code
      t.string :continent_name
      t.string :country_code
      t.string :country_name
      t.string :region_code
      t.string :region_name
      t.string :city
      t.integer :zip
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
