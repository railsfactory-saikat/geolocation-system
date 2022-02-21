# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.belongs_to :geolocation, foreign_key: true
      t.integer :geoname_id, null: false
      t.string :capital
      t.string :languages
      t.string :country_flag
      t.string :country_flag_emoji
      t.string :country_flag_emoji_unicode
      t.integer :calling_code
      t.boolean :is_eu

      t.timestamps
    end
  end
end
