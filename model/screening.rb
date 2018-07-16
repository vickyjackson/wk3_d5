require('pg')
require_relative('film')
require_relative('../db/sql_runner')
require_relative('customer')

class Screening

  attr_writer :id, :screening, :sceen, :film_id
  attr_reader :id, :screening, :screen, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @screening = options['screening']
    @screen = options['screen']
    @film_id = options['film_id'].to_i
  end

  # Create
  def save()
    sql = "INSERT INTO screenings (screening, screen, film_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@screening, @screen, @film_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # Read
  def self.find_by_id(id)
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    screening = Screening.new(result)
    return screening
  end

  def films
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = film_id WHERE tickets.screening_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    films = result.map { |film| Film.new(film) }
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE tickets.screening_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    tickets = result.map { |ticket| Ticket.new(ticket) }
    return tickets
  end

  # Update


  # Delete

end
