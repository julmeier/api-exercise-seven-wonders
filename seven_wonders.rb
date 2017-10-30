require 'httparty'
require 'awesome_print'
#Starter Code:

class Locations

  def initialize(place_names)
    @place_names = place_names
  end

  def all_places_latlng
    result = {}
    @place_names.each do |place_name|
      place_uri = URI.encode("https://maps.googleapis.com/maps/api/geocode/json?address=#{ place_name }")
      place_response = HTTParty.get(place_uri).parsed_response
      lat = place_response["results"][0]["geometry"]["location"]["lat"]
      lng = place_response["results"][0]["geometry"]["location"]["lng"]
      latlong = {}
      latlong["lat"] = lat
      latlong["lng"] = lng
      result[place_name] = latlong
    end
    return result
  end

end

seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

locations = Locations.new(seven_wonders)

ap locations.all_places_latlng








#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Pharos of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
