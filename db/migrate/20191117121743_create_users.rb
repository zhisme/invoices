class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :auth_token
      t.json :settings, default: {}

      t.timestamps
    end

    add_index :users, :auth_token
  end
end
