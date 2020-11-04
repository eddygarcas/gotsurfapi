class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.integer :point
      t.string :city

      t.timestamps
    end
  end
end
