require 'httparty'
require 'crack'
module Api::V1::SpotsHelper

  class Metrics
    def self.direction_icon direction = 0
      unicode = ""
      case direction
      when (0..22)
        unicode = "⬇"
      when (22..67)
        unicode = "↙"
      when (68..110)
        unicode = "⬅"
      when (111..156)
        unicode = "↖"
      when (157..200)
        unicode = "⬆"
      when (201..247)
        unicode = "↗"
      when (248..291)
        unicode = "➡"
      when (292..336)
        unicode = "↘"
      else
        unicode = "⬇"
      end
      return unicode
    end
  end


  class AemetSheet
    include HTTParty
    format :json

    def get_point(point)
      parse_response(self.class.post(Rails.application.credentials.services[:aemet], body: {point: point}))
    end

    private

    def parse_response(response)
      response.body.gsub!("colspan=2", "").
          gsub!("colspan=4", "").
          gsub!("colspan=3", "").
          gsub!("class=\"datacell\"", "").
          gsub!("td", "swell").
          gsub!("tr", "data").
          gsub!("tbody", "spot")
      Crack::XML.parse(response.body)["div"]["div"][0]["table"]["spot"]
    end
  end

end
