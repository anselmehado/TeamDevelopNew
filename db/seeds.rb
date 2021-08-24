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
    # password_confirmation: "JETroot1982",
		admin: true]
)
