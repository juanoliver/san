class AddMachineToAlarms < ActiveRecord::Migration
  def change
    add_reference :alarms, :machine, index: true
  end
end
