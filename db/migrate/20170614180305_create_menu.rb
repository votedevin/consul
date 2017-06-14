class CreateMenu < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :sort_index, default: 1

      t.timestamps null: false
    end
  end
end
