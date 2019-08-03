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
end
