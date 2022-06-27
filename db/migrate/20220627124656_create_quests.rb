class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.string :title
      t.integer :step

      t.timestamps
    end
  end
end
