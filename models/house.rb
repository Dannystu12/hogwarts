require_relative "../db/sql_runner"

class House
  attr_reader :id, :name, :url
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @url = options["url"]
  end

  def save()
    sql = "INSERT INTO houses(name, url) VALUES($1, $2) RETURNING id"
    values = [@name, @url]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.find_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    result = SqlRunner.run(sql, [id])
    return House.new(result[0])
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end
end
