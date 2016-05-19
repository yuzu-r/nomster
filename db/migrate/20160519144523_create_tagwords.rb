class CreateTagwords < ActiveRecord::Migration
  def change
    create_table :tagwords do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
