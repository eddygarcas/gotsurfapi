json.spots @spots do |s|
  json.flag s.flag
  json.city s.city
  json.point s.point
  json.url api_v1_spots_to_show_url(s.point,format: :json)
end