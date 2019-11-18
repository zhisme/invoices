class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :auth_token

      t.timestamps
    end

    add_index :users, :auth_token
    add_index :users, :login, unique: true
  end
end
