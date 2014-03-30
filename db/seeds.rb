# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p "Creating Respect Questions"
Question.create(question: "I listened respectfully when adults and my peers and were speaking.", core_value_id: 1)
Question.create(question: "I expressed appreciation by saying thank you.", core_value_id: 1)
Question.create(question: "I did something truly nice for someone else.", core_value_id: 1)
Question.create(question: "I allowed others to speak without interrupting them.", core_value_id: 1)
Question.create(question: "I was polite with my words and actions when dealing with adults.", core_value_id: 1)
Question.create(question: "I was polite with my words and actions when dealing with my peers.", core_value_id: 1)
Question.create(question: "I kept my temper in check when dealing with adults or my peers.", core_value_id: 1)
Question.create(question: "I did not argue with authority figures.", core_value_id: 1)
Question.create(question: "I did not insult anyone, swear, or use hurtful language, not even as a joke.", core_value_id: 1)
Question.create(question: "I did not engage in any horseplay or put my hands on anyone else.", core_value_id: 1)

p "Creating Integrity Questions"
Question.create(question: "I came to class prepared with my completed homework, two books, and all class materials.", core_value_id: 2)
Question.create(question: "I followed all directions the first time they were given.", core_value_id: 2)
Question.create(question: "I remembered and followed expectations in the classroom, even if nobody was watching.", core_value_id: 2)
Question.create(question: "I remembered and followed expectations in the hallways, transitions, lunch and free time, even if nobody was watching.", core_value_id: 2)
Question.create(question: "I remembered and followed expectations at home, even if nobody was watching.", core_value_id: 2)
Question.create(question: "I remembered and followed rules with interacting with my peers.", core_value_id: 2)
Question.create(question: "I got to work on assignments right away instead of waiting until the last minute.", core_value_id: 2)
Question.create(question: "I paid attention and resisted distractions.", core_value_id: 2)

p "Creating Perseverance Questions"
Question.create(question: "When something bad happened, I thought about what I could do to make it better next time.", core_value_id: 3)
Question.create(question: "I remained calm even in situations where I could have gotten angry or upset.", core_value_id: 3)
Question.create(question: "I stayed motivated, even if things weren't going well.", core_value_id: 3)
Question.create(question: "I believed that I could improve on things I struggled with.", core_value_id: 3)
Question.create(question: "I am sticking with something that I have been trying for a while now.", core_value_id: 3)
Question.create(question: "I stayed committed to my goals throughout the day.", core_value_id: 3)
Question.create(question: "I kept working on something even when I felt like quitting.", core_value_id: 3)

p "Creating Passion Questions"
Question.create(question: "I was eager and excited to come to school today.", core_value_id: 4)
Question.create(question: "I asked smart questions to better understand lessons.", core_value_id: 4)
Question.create(question: "I took steps to learn more about something beyond what I learned in class.", core_value_id: 4)
Question.create(question: "I actively participated in all classes by answering questions and carefully completing classwork.", core_value_id: 4)
Question.create(question: "I showed enthusiasm for learning in my classes.", core_value_id: 4)
Question.create(question: "I approached new situations and challenges with excitement and energy.", core_value_id: 4)
Question.create(question: "I shared something I learned with another person.", core_value_id: 4)

p "Creating Empowerment Questions"
Question.create(question: "I truly that my future will be determined by how hard I work.", core_value_id: 5)
Question.create(question: "I truly that every member of our team is smart and capable of great things.", core_value_id: 5)
Question.create(question: "I encouraged a group I was in to accomplish something.", core_value_id: 5)
Question.create(question: "I brought a smile to someone's face.", core_value_id: 5)
Question.create(question: "I helped someone master a skill or lesson.", core_value_id: 5)
Question.create(question: "I talked to someone when they were struggling.", core_value_id: 5)
Question.create(question: "I gave advice or listened to advice from someone.", core_value_id: 5)
Question.create(question: "I spoke up for what was right in a tough situation.", core_value_id: 5)

p "Creating Team, Love, and Family Questions"
Question.create(question: "I showed that I cared about the feelings of others.", core_value_id: 6)
Question.create(question: "I worked with different social groups within the SWOT team.", core_value_id: 6)
Question.create(question: "I forgave someone if they made a mistake this week.", core_value_id: 6)
Question.create(question: "I took care of my own family this week.", core_value_id: 6)
Question.create(question: "I took care of my friends this week.", core_value_id: 6)
Question.create(question: "I took care of my teachers and coaches this week.", core_value_id: 6)
Question.create(question: "I did not jump to any conclusions about others this week.", core_value_id: 6)

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
