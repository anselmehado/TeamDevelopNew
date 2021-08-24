# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#


# User.create(
#     [name: "userY",
#     email: "userY@yahoo.com",
#     password_digest: "JETroot1982",
#     password_confirmation: "JETroot1982",
# 		admin: false]
# )



User.create(
    [name: "jonas",
    email: "jonas@yahoo.com",
    password_digest: "JETroot1982",
    password_confirmation: "JETroot1982",
		admin: true]
)
























# 10.times do |index|
# 	User.create!(
# 	    name: Faker::Name.name,
# 	    email: Faker::Internet.email,
# 	    password: "password",
# 	    password_confirmation: "password",
# 	)
# end
#
#
#
#
#
# def time_rand from = 0.0, to = Time.now
#     Time.at(from + rand * (to.to_f - from.to_f))
# end
#
# 10.times do |index|
# 	Task.create!(
# 	    task_name: Faker::Lorem.words,
# 	    content: Faker::Lorem.sentence,
# 	    status: ["complete","inprogres","unstated"].sample,
# 	    deadline: time_rand.year.to_s+"/"+time_rand.month.to_s+"/"+time_rand.day.to_s,
# 	    priority: ["high", "medium","low"].sample,
# 	    user_id: User.all.pluck(:id).sample,
# 	)
# end
