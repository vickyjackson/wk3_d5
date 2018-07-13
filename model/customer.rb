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
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # Read
  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = film_id WHERE tickets.customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    films = result.map { |film| Film.new(film) }
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE tickets.customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    tickets = result.map { |ticket| Ticket.new(ticket) }
    return tickets
  end

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

  # Other methods
  def count_tickets()
    tickets.count()
  end

end
