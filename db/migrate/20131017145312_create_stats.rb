class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :name
      t.string :abbreviation
      t.boolean :is_primary?, null: false, default: false
    end
  end
end
