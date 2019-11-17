class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :title, null: false
      t.belongs_to :company

      t.timestamps
    end
  end
end
