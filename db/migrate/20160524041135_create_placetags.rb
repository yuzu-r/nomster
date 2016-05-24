class CreatePlacetags < ActiveRecord::Migration
  def change
    create_table :placetags do |t|
      t.integer :tagword_id
      t.integer :place_id

      t.timestamps null: false
    end
    add_index :placetags, :tagword_id
    add_index :placetags, :place_id
    add_index :placetags, [:tagword_id, :place_id], unique: true
  end
end
