# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if (user = User.find_by(email: 'lafwind@gmail.com')) && (!user.has_role?("Admin"))
  user.update(role: "Admin")
end

unless (User.find_by(role: "Admin") || User.find_by(email: 'lafwind@gmail.com'))
  User.create!(name: 'lafwind', email: 'lafwind@gmail.com', password: 'password', password_confirmation: 'password', role: 'Admin')# .skip_confirmation!
end
