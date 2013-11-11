class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :stat_id
      t.string :text

      t.timestamps
    end
    add_index :skills, :stat_id
  end
end
