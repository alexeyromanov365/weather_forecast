class WeatherService
  def initialize(address)
    @address = address
  end

  def address_data
    geocoding_service.address_data
  end

  def from_cache?
    Rails.cache.exist?(cache_key)
  end

  def weather_data
    Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
      forecast_service.fetch_weather
    end
  end

  private

  attr_reader :address

  def geocoding_service
    @geocoding_service ||= GeocodingService.new(address)
  end

  def forecast_service
    @forecast_service ||= Forecast::OpenMeteoService.new(geocoding_service.coordinates)
  end

  def cache_key
    "weather_data_#{postal_code}"
  end

  def postal_code
    geocoding_service.postal_code
  end
end
