# frozen_string_literal: true

require 'rails_helper'

describe WeatherController do
  context 'when condition' do
    it 'succeeds' do
      get :show

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['temperature']).to be_a(Float)
    end
  end
end
