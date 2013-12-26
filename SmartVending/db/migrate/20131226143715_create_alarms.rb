class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.integer :extID
      t.string :status
      t.string :severity
      t.datetime :date
      t.string :object
      t.string :category
      t.string :type

      t.timestamps
    end
  end
end
