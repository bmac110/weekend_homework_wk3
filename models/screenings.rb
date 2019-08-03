class Screening
  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @showtime = options["showtime"]
    @film_id = options["film_id"].to_i()
  end
end
