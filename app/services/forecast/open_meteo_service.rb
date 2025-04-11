module Forecast
  class OpenMeteoService < BaseService
    def fetch_weather
      OpenMeteo::Forecast.new.get(location: location, variables: variables)
    end

    private

    def location
      OpenMeteo::Entities::Location.new(latitude: latitude, longitude: longitude)
    end

    def variables
      {
        current: %i[temperature_2m weather_code],
        daily: %i[temperature_2m_max temperature_2m_min]
      }
    end
  end
end
