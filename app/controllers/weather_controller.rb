class WeatherController < ApplicationController
  def show
  end

  def create
    response = Faraday.get("https://nominatim.openstreetmap.org/search", { q: params[:address], format: "json" })
    address_data = JSON.parse(response.body)

    location = OpenMeteo::Entities::Location.new(
      latitude: address_data.first["lat"].to_d,
      longitude: address_data.first["lon"].to_d
    )

    variables = { current: %i[temperature_2m], hourly: %i[], daily: %i[] }
    weather_data = OpenMeteo::Forecast.new.get(location: location, variables: variables)

    render json: {
      temperature: weather_data.current.item.temperature_2m,
      address: address_data.first["name"],
      address_extra: address_data.first["display_name"]
    }, status: 200
  end
end
