class Api::V1::SpotsController < ApiController
  include Api::V1::SpotsHelper
  before_action :set_spot

  def show
    raise ApplicationHelper::SpotError if @spot.blank?
    get_data_from_aemet unless @spot.records?
  end

  def points
    @spots = Spot.all
  end

  private

  def set_spot
    @spot = Spot.find_by_point(params[:point])
  end

  def get_data_from_aemet
    Swell.transaction do
      AemetSheet.new.get_point(params[:point])["data"].each do |swell|
        @spot.swells.where(date: swell["swell"][0]).
            first_or_create(Swell.parse swell).update(Swell.parse swell)
      end
    end
  end

end
