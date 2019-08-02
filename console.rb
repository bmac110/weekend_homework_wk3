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





binding.pry()

nil
