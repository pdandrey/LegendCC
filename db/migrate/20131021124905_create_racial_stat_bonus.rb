class CreateRacialStatBonus < ActiveRecord::Migration
  def change
    create_table :racial_stat_bonus do |t|
      t.integer :race_id, null:false
      t.integer :stat_id, null:true
      t.integer :bonus, null:false
    end

    add_index :racial_stat_bonus, [:race_id, :stat_id]

  end
end
