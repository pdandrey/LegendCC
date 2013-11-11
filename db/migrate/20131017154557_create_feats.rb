class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
      t.text :name
      t.string :sub_type
      t.text :flavor
      t.text :prerequisite
      t.text :benefit

      t.timestamps
    end
  end
end
