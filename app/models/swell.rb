class Swell < ApplicationRecord
  include Api::V1::SpotsHelper
  belongs_to :spot

  scope :forecast, -> {where('date >= ?', DateTime.now + 3).order('date asc')}

  def self.parse swell
        {date: swell["swell"][0],
        wind: swell["swell"][2],
        winddir: swell["swell"][3].split("-")[1],
        windegrees: swell["swell"][3].split("-")[0],
        swelldir: swell["swell"][5].split("-")[1],
        degrees: swell["swell"][5].split("-")[0],
        height: swell["swell"][4],
        period: swell["swell"][6]}
  end

  def swellicon
    Metrics.direction_icon degrees
  end

  def windicon
    Metrics.direction_icon windegrees
  end

end
