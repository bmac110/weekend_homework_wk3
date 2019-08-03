require_relative("../db/sql_runner")

class Screening

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @showtime = options["showtime"]
    @film_id = options["film_id"].to_i()
  end

  def save()
    sql = "INSERT INTO screenings (showtime, film_id) VALUES ($1, $2) RETURNING id"
    values = [@showtime, @film_id]
    screening = SqlRunner.run(sql, values).first()
    @id = screening["id"].to_i()
  end

  def update()
    sql = "UPDATE screenings SET (showtime, film_id) = ($1, $2) WHERE id = $3"
    values = [@showtime, @film_id, @id]
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

end
