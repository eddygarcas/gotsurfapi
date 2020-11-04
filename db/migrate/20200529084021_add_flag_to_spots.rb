class AddFlagToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :flag, :string
  end
end
