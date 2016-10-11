class CreateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.string :table_name
      t.string :description

      t.references :category
    end
  end
end
