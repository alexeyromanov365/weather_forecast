# frozen_string_literal: true

require 'rails_helper'

describe WeatherController do
  describe "POST #create" do
    it 'should return temperature, address and additional address info' do
      post :create, params: { address: 'Paris' }

      expect(response).to be_successful

      aggregate_failures do
        expect(subject.instance_variable_get('@address_data')['name']).to eq('Paris')
        expect(subject.instance_variable_get('@address_data')['display_name'])
          .to eq('Paris, Ile-de-France, Metropolitan France, France')
        expect(subject.instance_variable_get('@weather_data').current.item.temperature_2m).to be_a(Float)
        expect(subject.instance_variable_get('@weather_data').current.item.weather_code).to be_a(Integer)
        expect(subject.instance_variable_get('@weather_data').daily.items.first.temperature_2m_min).to be_a(Float)
        expect(subject.instance_variable_get('@weather_data').daily.items.first.temperature_2m_max).to be_a(Float)
      end
    end
  end
end
