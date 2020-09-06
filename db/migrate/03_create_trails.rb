class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :type
      t.string :length
      t.text :description
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
