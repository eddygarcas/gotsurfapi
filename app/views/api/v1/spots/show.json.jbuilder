json.spot do
json.url api_v1_spots_points_url(@spot,format: :json)
json.swells @spot.swells do |s|
    json.(@spot, :flag)
    json.(@spot, :city)
    json.date         s.date.strftime("%d-%m-%Y")
    json.hour         s.date.strftime("%H")

    json.wind do
      json.category   "💨"
      json.speed      s.wind
      json.unit       "m/s"
      json.direction  s.winddir
      json.degrees    s.windegrees
      json.icon       s.windicon
    end
    json.swell do
      json.category   "🌊"
      json.height     s.height
      json.unit       "m"
      json.direction  s.swelldir
      json.degrees    s.degrees
      json.icon       s.swellicon
      json.period     s.period
    end
end
end