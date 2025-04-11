# Weather Forecast Application

A Ruby on Rails application that provides weather forecasts using OpenMeteo API and geocoding services.

## Key features:
- Address-based weather lookup
- Geocoding integration
- Weather data caching (30 minutes)
- Responsive design
- Error handling

## Ruby version
- Ruby 3.1.0 or higher (Ruby 3.3 recommended version)
- Rubygems 1.8.11 or higher

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/alexeyromanov365/weather_forecast.git
   cd weather_forecast
   
2. Run the puma server:
    ```bash
    rails s
   
3. Open your browser and go to `localhost:3000`

## API Endpoints

### `GET /`
- Description: Weather search form page
- Response: HTML page with search interface

### `POST /weather`
- Description: Get weather data for specified address
- Parameters:
  ```json
  {
    "address": "string (required)"
  }

## Example Response
[Response](example_response.json)
