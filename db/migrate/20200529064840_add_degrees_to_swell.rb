class AddDegreesToSwell < ActiveRecord::Migration[6.0]
  def change
    add_column :swells, :degrees, :integer
  end
end
