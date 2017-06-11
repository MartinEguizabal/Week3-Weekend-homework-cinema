require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Max', 'funds' => '24'})
customer1.save()
customer2 = Customer.new({'name' => 'Sally', 'funds' => '25'})
customer2.save()
customer3 = Customer.new({'name' => 'John', 'funds' => '35'})
customer3.save()

film1 = Film.new({'title' => 'Napoleon Dynamite', 'price' => '7'})
film1.save()
film2 = Film.new({'title' => 'Alien III', 'price' => '15'})
film2.save()
film3 = Film.new({'title' => 'Gladiator', 'price' => '17'})
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket6.save()

binding.pry
nil

