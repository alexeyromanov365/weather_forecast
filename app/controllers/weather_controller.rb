# WeatherController handles weather forecast requests and responses
#
# The controller provides two main actions:
# - show: Displays the weather search form
# - create: Processes the search request and displays weather data
#
# Example usage:
#   GET /weather - Shows the search form
#   POST /weather - Processes the search and shows results
class WeatherController < ApplicationController
  # Displays the weather search form
  def show
  end

  # Processes the weather search request
  #
  # This action:
  # 1. Creates a WeatherService instance with the provided address
  # 2. Retrieves address data and weather information
  # 3. Handles cases where data cannot be retrieved
  # 4. Renders the appropriate view with the results
  #
  # @param address [String] The address to get weather for
  def create
    weather_service = WeatherService.new(params[:address])

    @address_data = weather_service.address_data
    unless @address_data
      flash.now[:alert] = "Could not find location for the provided address"
      render :show and return
    end

    @from_cache = weather_service.from_cache?
    @weather_data = weather_service.weather_data

    unless @weather_data
      flash.now[:alert] = "Unable to fetch weather data. Please try again later."
      render :show and return
    end
  end
end
