require_relative("../db/sql_runner.rb")


class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"].to_i()

  end

  def save()
    sql = "INSERT INTO films(title, price) VALUES($1, $2) RETURNING ID"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first()
    @id = film["id"].to_i()

  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def delete(id)
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET(title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map{|film| Film.new(film)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [id]
    films = SqlRunner.run(sql, values).first()
    return Film.new(films)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets
    ON customers.id = tickets.customer_id WHERE tickets.film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map{|customer| Customer.new(customer)}
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE film_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def self.watching_film(film)
    watching = film.tickets.count
    return watching
  end

  def screenings()
    sql = "SELECT screenings.* FROM screenings INNER JOIN tickets
    ON screenings.id = tickets.screening_id WHERE tickets.film_id = $1"
    values = [@id]
    screenings = SqlRunner.run(sql, values)
    return screenings.map{|screening| Screening.new(screening)}
  end

  def popular_showtime()
    screenings = screenings()
    screening_times = screenings.map{|screening| screening.showtime}
    return screening_times.max_by{|time| screening_times.count(time)}
  end


end
