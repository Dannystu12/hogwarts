require_relative "../models/student"
require_relative "../models/house"

Student.delete_all()
House.delete_all()

gryffindor = House.new({"name" => "Gryffindor", "url" => "https://i.ebayimg.com/images/g/2W4AAOSwTglYmNx4/s-l300.jpg"})

slytherin = House.new({"name" => "Slytherin", "url" => "https://i.ebayimg.com/images/g/fk0AAOSw5cNYmN3j/s-l300.jpg"})

gryffindor.save()
slytherin.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => gryffindor.id,
  "age" => "12"
  })

student2 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house_id" => slytherin.id,
  "age" => "13"
  })

student1.save()
student2.save()
