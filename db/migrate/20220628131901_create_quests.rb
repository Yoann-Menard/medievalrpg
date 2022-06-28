class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.string :title
      t.integer :exp
      t.string :item
      t.string :content
      t.string :png

      t.timestamps
    end
  end
end
