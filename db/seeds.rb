# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Customer.delete_all
open("db/customers.csv") do |customers|
  customers.read.each_line do |customer|
    name , account_balance , phone = customer.chomp.split(";")
    Customer.create!(:name => name, :account_balance => account_balance , :phone => phone)
  end
end

Alarm.delete_all
open("db/alarms.csv") do |alarms|
  alarms.read.each_line do |alarm|
    id , status, severity, date, object, category, type = alarm.chomp.split(";")
    Alarm.create!(:extID => id, :status => status , :severity => severity, :date => date, :object => object,  :category => category, :tipe => type)
  end
end

Machine.delete_all
open("db/machines.csv") do |machines|
  machines.read.each_line do |machine|
    id , name, description, category, status, nombre_ciudad, provincia  = machine.chomp.split(";")
    Machine.create!(:extID => id, :name => name, :description => description, :status => status,  :category => category, :nombre_ciudad => nombre_ciudad, :provincia => provincia)
  end
end

