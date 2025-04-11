class WeatherController < ApplicationController
  def show
  end

  def create
    weather_service = WeatherService.new(params[:address])

    @address_data = weather_service.address_data
    unless @address_data
      flash.now[:alert] = "Could not find location for the provided address"
      render :show and return
    end

    @from_cache = weather_service.from_cache?
    @weather_data = weather_service.weather_data
  end
end
