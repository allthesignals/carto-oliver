class AddTextToTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :sql, :text
    add_column :tables, :css, :text
  end
end
