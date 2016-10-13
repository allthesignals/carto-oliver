class AddFlagToTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :visible, :boolean, default: false
  end
end
