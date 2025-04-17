# GeocoderWrapper is a simple wrapper around the Geocoder gem that provides
# error handling and logging for geocoding operations.
#
# This module handles two types of geocoding operations:
# 1. Forward geocoding: converting addresses to coordinates
# 2. Reverse geocoding: converting coordinates to addresses
#
# Example usage:
#   GeocoderWrapper.search("1600 Pennsylvania Ave NW, Washington, DC") # Forward geocoding
#   GeocoderWrapper.search([38.8977, -77.0365]) # Reverse geocoding
#
# Returns:
#   - Geocoder::Result object on success
#   - nil on any error (with error logged)
module GeocoderWrapper
  # Performs a geocoding search operation with error handling
  #
  # @param query [String, Array] The address to geocode or coordinates to reverse geocode
  # @return [Geocoder::Result, nil] The geocoding result or nil if an error occurred
  def self.search(query)
    begin
      Geocoder.search(query).first
    rescue => e
      Rails.logger.error("Geocoding error: #{e.message}")
      nil
    end
  end
end 