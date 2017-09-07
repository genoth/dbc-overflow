user1 = User.create!(email: 'tom@tom.com', username: 'tom')
user2 = User.create!(email: 'tina@tina.com', username: 'tina')

titles = ["Colors", "Animals"]

questions = ["What's your favorite color?", "What's your favorite animal?"]

answers = ["My favorite color is blue.", "Mine is mauve.", "Dogs are my favorite animal.", "I am partial to nighthawks."]

comments = ["Blue sucks.", "Light blue!", "I'm a cat person, personally.", "Kitties!"]

2.times do |n|
  Question.create!(title: titles[n], body: questions[n], user_id: n + 1)
end

Answer.create!(body: answers[0], user_id: 1, question_id: 1)
Answer.create!(body: answers[1], user_id: 2, question_id: 1)
Answer.create!(body: answers[2], user_id: 1, question_id: 2)
Answer.create!(body: answers[3], user_id: 2, question_id: 2)

