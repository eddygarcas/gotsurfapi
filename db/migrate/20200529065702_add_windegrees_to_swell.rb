class AddWindegreesToSwell < ActiveRecord::Migration[6.0]
  def change
    add_column :swells, :windegrees, :integer
  end
end
