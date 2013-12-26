class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :extID
      t.string :name
      t.string :description
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
