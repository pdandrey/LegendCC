class CreateRacialSkillBonus < ActiveRecord::Migration
  def change
    create_table :racial_skill_bonus do |t|
      t.integer :race_id, null: false
      t.integer :skill_id
      t.integer :bonus, null: false
    end
    add_index :racial_skill_bonus, [:race_id, :skill_id], unique: true
  end
end
