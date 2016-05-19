class CreatePlacetags < ActiveRecord::Migration
  def change
    create_table :placetags do |t|
      t.belongs_to :tagword, index: true, foreign_key: true
      t.belongs_to :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
