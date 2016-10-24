class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|

      t.string :map_uuid
      t.string :map_name
      t.integer :position

      t.timestamps
    end
  end
end
