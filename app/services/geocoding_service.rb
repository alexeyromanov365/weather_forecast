class GeocodingService
  def initialize(address)
    @address = address
  end

  def address_data
    geocoded_address&.data
  end

  def postal_code
    Geocoder.search(coordinates).first.postal_code
  end

  def coordinates
    [latitude, longitude]
  end

  def latitude
    geocoded_address.latitude.to_d
  end

  def longitude
    geocoded_address.longitude.to_d
  end

  private

  attr_reader :address

  def geocoded_address
    @geocoded_address ||= Geocoder.search(address).first
  end
end
