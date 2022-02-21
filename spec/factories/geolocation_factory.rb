# frozen_string_literal: true

FactoryBot.define do
 factory :geolocation, class: "Geolocation" do
   ip { Faker::Internet.ip_v4_address }
 end
end
