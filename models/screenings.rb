require_relative("../db/sql_runner")

class Screening

  attr_accessor :showtime
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @showtime = options["showtime"]
  end

  def save()
    sql = "INSERT INTO screenings (showtime) VALUES ($1) RETURNING id"
    values = [@showtime]
    screening = SqlRunner.run(sql, values).first()
    @id = screening["id"].to_i()
  end

  def update()
    sql = "UPDATE screenings SET (showtime) = ($1) WHERE id = $2"
    values = [@showtime, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "select * FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map{|screening| Screening.new(screening)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [id]
    screenings = SqlRunner.run(sql, values)
    return Screening.new(screenings)
  end

  def delete(id)
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE screening_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

end
