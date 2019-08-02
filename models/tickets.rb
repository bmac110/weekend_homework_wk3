class Ticket

  def initialize(options)
    id = options["id"].to_i if options["id"]
    customer_id = options["customer_id"].to_i()
    film_id = options["film_id"].to_i()
  end


end
