require_relative '../db/sql_runner'

class Student
  attr_reader :id, :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house = options["house"]
    @age = options["age"].to_i
  end

  def save()
    sql = "INSERT INTO
    students(first_name, last_name, house, age)
    VALUES($1, $2, $3, $4)
    RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.read_all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    build_results(result)
  end

  def self.read_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1 LIMIT  1"
    result =  SqlRunner.run(sql,[id])
    return build_results(result)[0]

  end

  private
  def self.build_results(results, type=self)
    return results.map{|hash| type.new(hash)}
  end

end
