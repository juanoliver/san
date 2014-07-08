class AddGmapsToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :gmaps, :boolean
  end
end
