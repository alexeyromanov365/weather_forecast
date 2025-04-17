module GeocoderWrapper
  def self.search(query)
    begin
      Geocoder.search(query).first
    rescue => e
      Rails.logger.error("Geocoding error: #{e.message}")
      nil
    end
  end
end 