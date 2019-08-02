class Film

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

  def update()
    
  end


end