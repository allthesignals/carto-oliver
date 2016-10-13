class AddCategories < ActiveRecord::Migration[5.0]
  def self.up
    create_table :categories do |t|
      t.string :name

      t.integer :parent_id, :null => true, :index => true
      t.integer :sort_order

      t.integer :computed_depth, :null => true
    end
  end

  def self.down
    drop_table :categories
  end
end