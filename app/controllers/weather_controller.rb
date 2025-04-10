class WeatherController < ApplicationController
  def show
    location = OpenMeteo::Entities::Location.new(latitude: 43.70.to_d, longitude: -79.41.to_d)
    variables = { current: %i[temperature_2m], hourly: %i[], daily: %i[] }
    data = OpenMeteo::Forecast.new.get(location: location, variables: variables)

    render json: { temperature: data.current.item.temperature_2m }
  end
end
