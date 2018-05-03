require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('models/student.rb')

get '/hogwarts/all-students' do
  @students = Student.read_all()
  erb(:all_students)
end

get '/hogwarts/new-student' do
  erb(:new_student)
end

post '/hogwarts/new-student' do
  student = Student.new params
  student.save()
  erb(:success)
end
