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


