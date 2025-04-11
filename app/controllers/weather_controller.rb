class WeatherController < ApplicationController
  def show
  end

  def create
    response = Faraday.get(
      "https://nominatim.openstreetmap.org/search",
      { q: params[:address], limit: 1, "accept-language" => "en", format: "json" }
    )

    address_data = JSON.parse(response.body)

    location = OpenMeteo::Entities::Location.new(
      latitude: address_data.first["lat"].to_d,
      longitude: address_data.first["lon"].to_d
    )

    variables = { current: %i[temperature_2m weather_code], daily: %i[temperature_2m_max temperature_2m_min] }

    weather_data = OpenMeteo::Forecast.new.get(location: location, variables: variables)

    @address_data = address_data.first
    @weather_data = weather_data
  end
end
