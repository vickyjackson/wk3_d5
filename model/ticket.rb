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


  # Read
  

  # Update


  # Delete


end
