require('pg')
require_relative('film')
require_relative('customer')
require_relative('../db/sql_runner')

class Ticket

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @film_id = options['film_id']
    @customer_id = options['customer_id']
  end

  # Create
  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES  ($1, $2) RETURNING $3"
    values = [@film_id, @customer_id, @id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


  # Read


  # Update


  # Delete


end
