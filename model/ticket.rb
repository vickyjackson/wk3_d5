require('pg')
require_relative('film')
require_relative('customer')
require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :film_id, :customer_id
  attr_writer :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @film_id = options['film_id']
    @customer_id = options['customer_id']
  end

  # Create
  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES ($1, $2) RETURNING id"
    values = [@film_id, @customer_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # Read


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

end
