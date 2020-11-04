class CreateSwells < ActiveRecord::Migration[6.0]
  def change
    create_table :swells do |t|
      t.references :spot, null: false, foreign_key: true
      t.datetime :date
      t.float :wind
      t.string :winddir
      t.string :swelldir
      t.float :height
      t.float :period

      t.timestamps
    end
  end
end
