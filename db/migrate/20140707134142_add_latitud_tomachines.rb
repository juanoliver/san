class AddLatitudTomachines < ActiveRecord::Migration
  def change
      add_column :machines, :latitude, :float
      add_column :machines, :longitude, :float
  end
end
