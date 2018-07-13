require('pg')
require_relative('film')
require_relative('../db/sql_runner')

class Customer

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @funds = options['funds']
  end

  # Create
  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING ID"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


  # Read


  # Update


  # Delete


end
