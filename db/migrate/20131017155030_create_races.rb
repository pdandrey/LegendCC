class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :size
      t.string :type
      t.integer :bonus_feat_count

      t.timestamps
    end
  end
end
