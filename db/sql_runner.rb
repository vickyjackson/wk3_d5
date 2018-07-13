require('pg')

class SqlRunner

  def initialize()
  end

  # Note to self - remember to practice writing from scratch!
  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'cinema', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
