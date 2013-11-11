class CreateRacialBonus < ActiveRecord::Migration
  def change
    create_table :racial_bonus do |t|
      t.integer :race_id
      t.string :bonus
    end
  end
end
