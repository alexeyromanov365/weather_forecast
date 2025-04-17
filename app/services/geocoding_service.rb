# GeocodingService is responsible for handling all geocoding-related operations
# in the application. It uses GeocoderWrapper to perform the actual geocoding
# operations and provides a clean interface for accessing geocoding data.
#
# The service handles:
# - Converting addresses to coordinates
# - Getting postal codes for locations
# - Accessing address components
#
# Example usage:
#   service = GeocodingService.new("1600 Pennsylvania Ave NW, Washington, DC")
#   service.coordinates # => [38.8977, -77.0365]
#   service.postal_code # => "20500"
class GeocodingService
  # Initializes a new GeocodingService instance
  #
  # @param address [String] The address to geocode
  def initialize(address)
    @address = address
  end

  # Returns the complete address data from the geocoding result
  #
  # @return [Hash, nil] The address data or nil if geocoding failed
  def address_data
    geocoded_address&.data
  end

  # Returns the postal code for the location
  # Uses reverse geocoding to get the postal code from coordinates
  #
  # @return [String, nil] The postal code or nil if geocoding failed
  def postal_code
    GeocoderWrapper.search(coordinates)&.postal_code
  end

  # Returns the coordinates for the address
  #
  # @return [Array] Array containing [latitude, longitude] or [nil, nil] if geocoding failed
  def coordinates
    [latitude, longitude]
  end

  # Returns the latitude for the address
  #
  # @return [BigDecimal, nil] The latitude or nil if geocoding failed
  def latitude
    geocoded_address&.latitude&.to_d
  end

  # Returns the longitude for the address
  #
  # @return [BigDecimal, nil] The longitude or nil if geocoding failed
  def longitude
    geocoded_address&.longitude&.to_d
  end

  private

  attr_reader :address

  # Returns the geocoded address result
  # Caches the result to avoid multiple API calls
  #
  # @return [Geocoder::Result, nil] The geocoding result or nil if geocoding failed
  def geocoded_address
    @geocoded_address ||= GeocoderWrapper.search(address)
  end
end
