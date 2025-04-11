require "rails_helper"

describe Forecast::OpenMeteoService do
  let(:latitude) { BigDecimal("40.7128") }
  let(:longitude) { BigDecimal("-74.0060") }
  let(:coordinates) { [latitude, longitude] }
  let(:service) { described_class.new(coordinates) }

  describe "#fetch_weather" do
    it "returns weather from the OpenMeteo service" do
      expect(service.fetch_weather.current.item.temperature_2m).to be_a(Float)
    end
  end
end
