class AddNombreCiudadToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :nombre_ciudad, :string
    add_column :machines, :provincia, :string
  end
end
