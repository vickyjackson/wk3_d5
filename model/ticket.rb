require('pg')
require_relative('film')
require_relative('customer')
require_relative('screening')
require_relative('../db/sql_runner')
require('pry')

class Ticket

  attr_reader :id, :customer, :screening

  def initialize(options)
    @customer = options['customer']
    @screening = options['screening']
    @id = options['id'].to_i if options['id'] != nil
    if options['customer_id']
      @customer = Customer.find_by_id(options['customer_id'])
    end
    if options['screening_id']
      @screening = Screening.find_by_id(options['screening_id'])
    end
  end

  # Create
  def save()
    sql = "INSERT INTO tickets (customer_id, screening_id) VALUES ($1, $2) RETURNING id"
    values = [@customer.id, @screening.id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
    charge_customer()
  end

  # Read

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@screening.film_id]
    result = SqlRunner.run(sql, values)[0]
    film = Film.new(result)
  end

  # Update
  def update()
    sql = "UPDATE tickets SET (customer_id, screening_id) = ($1, $2) WHERE id = $3"
    values = [@customer.id, @screening.id, @id]
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
