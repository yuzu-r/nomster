class AddUniqueIndexToPlacetags < ActiveRecord::Migration
  def change
    add_index :placetags, [:place_id, :tagword_id], unique: true
  end
end
