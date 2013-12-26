class CambioAlarms < ActiveRecord::Migration
  def change
    change_table :alarms do |t|
       t.rename :type, :tipe
    end
  end
end
