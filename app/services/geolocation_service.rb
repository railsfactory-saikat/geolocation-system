# frozen_string_literal: true

class GeolocationService
  include Interactor
  delegate :params, :user, :geo_id, :before_save, to: :context

  def call
    geolocation = user.geolocations.new(geolocations_params)
    return geolocation.create_location(location_params) if geolocation.save

    context.fail!
  end

  def geolocation_data_formatter
    geolocation = user.geolocations.find_by(id: geo_id)
    return "Record Not Found!" if geolocation.blank?

    parsed_location = JSON.parse geolocation.location.to_json
    geolocation_attr = JSON.parse(geolocation.to_json).merge("location" => parsed_location)
    geolocation_attr["location"]["languages"] = JSON.parse geolocation_attr["location"]["languages"]
    geolocation_attr
  end

  private

  def geolocations_params
    params.permit(:ip, :ip_type, :continent_code, :continent_name, :country_code, :country_name,
                  :region_code, :region_name, :city, :zip, :latitude, :longitude)
  end

  def location_params
    format_languages_params
    params.require(:location).permit(:geoname_id, :capital, :languages, :country_flag, :country_flag_emoji,
                                     :country_flag_emoji_unicode, :calling_code, :is_eu)
  end

  def format_languages_params
    params[:location][:languages] = params[:location][:languages].to_json
  end
end
