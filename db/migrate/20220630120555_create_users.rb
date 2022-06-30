class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.boolean :is_game_master

      t.timestamps
    end
  end
end
