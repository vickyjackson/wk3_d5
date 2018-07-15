require('pg')
require_relative('film')
require_relative('customer')
require_relative('screening')
require_relative('../db/sql_runner')
require('pry')

class Ticket

  attr_reader :id, :film_id, :customer_id, :screening_id
  attr_writer :film_id, :customer_id, :screening_id

  def initialize(options)
    @customer = options['customer']
    @id = options['id'].to_i if options['id'] != nil
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  # Create
  def save()
    sql = "INSERT INTO tickets (film_id, customer_id, screening_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@film_id, @customer_id, @screening_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
    charge_customer()
  end

  # Read
  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    result = SqlRunner.run(sql, values)[0]
    film = Film.new(result)
  end

  # Update
  def update()
    sql = "UPDATE tickets SET (film_id, customer_id) = ($1, $2) WHERE id = $3"
    values = [@film_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  # Other methods
  def charge_customer()
    @customer.funds -= film.price
    @customer.update()
  end

end
