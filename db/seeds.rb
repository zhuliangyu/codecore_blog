# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  u=User.new
  u.first_name=Faker::Name.first_name
  u.last_name=Faker::Name.last_name
  u.password="123456"
  u.save
end

10.times do
  c=Category.new
  c.name=Faker::Company.profession
  c.save

end

50.times do
  p=Post.new
  p.title=Faker::Company.name #=> "Hirthe-Ritchie"
  p.body=Faker::Lorem.sentence
  p.category=Category.all.sample
  p.user=User.all.sample
  p.save


end

50.times do
  c=Comment.new
  c.title=Faker::Company.name #=> "Hirthe-Ritchie"
  c.body=Faker::Lorem.sentence
  c.post=Post.all.sample
  c.user=User.all.sample
  c.save

end