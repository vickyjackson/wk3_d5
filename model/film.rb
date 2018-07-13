require('pg')
require_relative('customer')
require_relative('../db/sql_runner')

class Film

  attr_reader :id, :title, :price
  attr_writer :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @title = options['title']
    @price = options['price']
  end

  # Create
  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # Read


  # Update
  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    result = SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run()
  end

end
