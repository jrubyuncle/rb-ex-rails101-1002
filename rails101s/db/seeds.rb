# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "hello world"

u = User.create(email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', name: 'test_account')

for j in 1..20 do
  Group.create(title: "group_no_#{j}",
               description: "#{j}-th by seed",
               user_id: u.id)

  for k in 1..30 do
    Post.create(group_id: j,
      content: "post-#{k}-group-#{j}",
      user_id: u.id)
  end
end