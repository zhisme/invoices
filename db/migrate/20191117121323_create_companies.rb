class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :title, null: false
      t.json :settings, default: {}
      t.belongs_to :user

      t.timestamps
    end

    add_index :companies, :title, unique: true
  end
end
