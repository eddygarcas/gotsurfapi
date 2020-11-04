class Spot < ApplicationRecord
  has_many :swells, -> { where('date >= ?', DateTime.now).order('date asc')}, dependent: :destroy

  def records?
    swells.forecast.count > 0
  end
end
