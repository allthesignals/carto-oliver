class AddPositionToTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :position, :integer
  end
end
