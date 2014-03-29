# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p "Creating Users"
User.create(username:"rachel", password: "password", password_confirmation: "password",
						first_name: "rachel", last_name: "warbelow")

User.create(username:"admin", password: "password", password_confirmation: "password",
						first_name: "rachel", last_name: "warbelow", user_type: "admin")


p "Creating Questions"
Question.create(question: "How are you1?", core_value_id: 1)
Question.create(question: "How are you2?", core_value_id: 1)
Question.create(question: "How are you2?", core_value_id: 1)
Question.create(question: "How are you3?", core_value_id: 2)
Question.create(question: "How are you3?", core_value_id: 2)
Question.create(question: "How are you4?", core_value_id: 2)
Question.create(question: "How are you5?", core_value_id: 3)
Question.create(question: "How are you5?", core_value_id: 3)
Question.create(question: "How are you6?", core_value_id: 3)
Question.create(question: "How are you7?", core_value_id: 4)
Question.create(question: "How are you8?", core_value_id: 4)
Question.create(question: "How are you8?", core_value_id: 4)
Question.create(question: "How are you9?", core_value_id: 5)
Question.create(question: "How are you10?", core_value_id: 5)
Question.create(question: "How are you10?", core_value_id: 5)
Question.create(question: "How are you11?", core_value_id: 6)
Question.create(question: "How are you11?", core_value_id: 6)
Question.create(question: "How are you12?", core_value_id: 6)

p "Creating Options"
Option.create(option: "Strongly agree", value: 100)
Option.create(option: "Agree", value: 80)
Option.create(option: "Neutral", value: 60)
Option.create(option: "Disagree", value: 20)
Option.create(option: "Strongy disagree", value: 0)

p "Creating Core Values"
CoreValue.create(name: "Respect & Humility")
CoreValue.create(name: "Integrity")
CoreValue.create(name: "Perseverance")
CoreValue.create(name: "Passion")
CoreValue.create(name: "Empowerment")
CoreValue.create(name: "Team, Love, & Family")
