


# User.create(
#     [name: "jonas",
#     email: "jonas@yahoo.com",
#     password_digest: "JETroot1982",
#     password_confirmation: "JETroot1982",
# 		admin: 'true']
# )


User.create(name: "anselme", email: "anselme@yahoo.fr", admin: "true", password: "123456", password_confirmation: "123456")


Label.create(title:"cop1")
Label.create(title:"cop2")
Label.create(title:"cop3")
Label.create(title:"cop4")


# Label.create(title: "cop1", user_id: 2);
# Label.create(title: "cop2", user_id: 2);
# Label.create(title: "cop3", user_id: 2);
# Label.create(title: "cop4", user_id: 2);
