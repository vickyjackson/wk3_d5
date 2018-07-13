require('pg')
require_relative('film')
require_relative('../db/sql_runner')

class Customer

  attr_reader :id, :name, :funds
  attr_writer :name, :funds

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
  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
