class FeatsRaces < ActiveRecord::Migration
  def change
    create_join_table :feats, :races
    add_index :feats_races, [:feat_id, :race_id], unique: true
  end
end
