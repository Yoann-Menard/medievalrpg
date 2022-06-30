class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :level
      t.integer :strength
      t.integer :hp
      t.integer :points
      t.integer :xp
      t.integer :id_user

      t.timestamps
    end
  end
end
