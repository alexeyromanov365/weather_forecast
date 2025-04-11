module Forecast
  class BaseService
    attr_reader :latitude, :longitude

    def initialize(coordinates)
      @latitude, @longitude = coordinates
    end

    def fetch_weather
      raise NotImplementedError
    end
  end
end
