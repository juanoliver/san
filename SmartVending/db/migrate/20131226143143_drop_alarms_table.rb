class DropAlarmsTable < ActiveRecord::Migration
  def change
       drop_table :alarms
  end
end
