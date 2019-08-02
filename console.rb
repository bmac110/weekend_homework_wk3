require_relative("./models/customers.rb")
require_relative("./models/films.rb")
require_relative("./models/tickets.rb")

require("pry-byebug")

Film.delete_all()
Customer.delete_all()


customer1 = Customer.new({
  "name" => "Jimmy",
  "funds" => 40
  })

customer1.save()

film1 = Film.new({
  "title" => "The Matrix",
  "price" => 12
  })

film1.save()

ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id
  })

ticket1.save()

# film1.price = 20
# film1.update()





binding.pry()

nil
