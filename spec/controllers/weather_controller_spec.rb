# frozen_string_literal: true

require 'rails_helper'

describe WeatherController do
  describe "POST #create" do
    it 'should return temperature, address and additional address info' do
      post :create, params: { address: 'Paris' }

      json = JSON.parse(response.body)

      expect(response).to be_successful

      aggregate_failures do
        expect(json['temperature']).to be_a(Float)
        expect(json['address']).to eq('Paris')
        expect(json['address_extra']).to eq('Paris, Île-de-France, France métropolitaine, France')
      end
    end
  end
end
