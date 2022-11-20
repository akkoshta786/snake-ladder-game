class CreatePaths < ActiveRecord::Migration[7.0]
  def change
    create_table :paths do |t|
      t.integer :source, null: false
      t.integer :destination, null: false
      t.references :board

      t.index :source, unique: true
      t.index %i[board source destination], unique: true
      t.timestamps
    end
  end
end
