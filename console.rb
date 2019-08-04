require_relative("./models/customers.rb")
require_relative("./models/films.rb")
require_relative("./models/tickets.rb")
require_relative("./models/screenings.rb")

require("pry-byebug")

Ticket.delete_all()
Screening.delete_all()
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

film2 = Film.new({
  "title" => "Ace Ventura",
  "price" => 12
  })

film1.save()
film2.save()

screening1 = Screening.new({
  "showtime" => "2019-08-04 16:30:00"
  })

screening2 = Screening.new({
  "showtime" => "2019-08-04 20:30:00"
  })

screening1.save()
screening2.save()

ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id,
  "screening_id" => screening1.id
  })

ticket2 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id,
  "screening_id" => screening2.id
  })

ticket3 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film2.id,
  "screening_id" => screening2.id
  })

ticket1.save()
ticket2.save()
ticket3.save()

# film1.price = 20
# film1.update()





binding.pry()

nil
