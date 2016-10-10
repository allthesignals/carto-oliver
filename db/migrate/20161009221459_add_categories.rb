class AddCategories < ActiveRecord::Migration[5.0]
  def self.up
    create_table :tables do |t|
      t.string :name
      t.string :table_name
      t.string :description

      t.boolean :is_geometric

      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0
    end
  end

  def self.down
    drop_table :tables
  end
end