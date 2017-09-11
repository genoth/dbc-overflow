user1 = User.create!(email: 'tom@tom.com', username: 'tom', password: 'tom')
user2 = User.create!(email: 'tina@tina.com', username: 'tina', password: 'tina')
user3 = User.create!(email: 'troll@troll.com', username: 'troll', password: 'troll')
user4 = User.create!(email: 'mod@mod.com', username: 'mod', password: 'mod')
user5 = User.create!(email: 'nice@nice.com', username: 'nice_person', password: 'nice')



title = ["Where is the best place to capture a unicorn?", "I think the Loch Ness Monster has stolen my sandwich.", "If a dragon has two arms, two legs, and two wings, does that make it an insect?", "Are penguins real?", "Does silver actually kill werewolves?", "In your scientific opinion, what is the best color for a sasquatch?", "what's the right spelling for 'griffin'?"]

body = ["Looking to capture a unicorn, preferably a yearling. I live on the East Coast but have a truck and am willing to drive if you know a good spot.", "I'm sitting next to the lake and my sandwich was there one minute and not the next. And no, before you ask, there aren't any seagulls around.", "Cause, like, I remember something like that in science class about six limbs being an insect and they use their wings kind of like limbs?", "I saw a book at Barnes and Nobel about penguins and it made me wonder. I have never seen a penguin. All the media could be CG like that happy feet movie. And when you think about it, birds swimming is kind of ridiculous.", "Asking for a friend. I'm not going to hunt werewolves or anything.", "I see a lot of pictures with, like, ridiculous blue sasquatch and I'm just like it cannot hide in the woods like that.", "is it griffin? gryphon? something else entirely???"]

question_comments = ["Can you be more specific about what you're looking for and how far you're willing to drive?", "Not sure this is pertinent to this site.", "Can you be more specific about what kind of dragon you're referring to? There's going to be a lot of disagreement due to different breeds.", "Have you ever been to the zoo?", "Please see the code of conduct page", "Do you mean 'sasquatch' to encompass yetis as well?", "Perhaps ask Google this instead." ]

tom_answers = ["I'd say Cental Park if you don't mind the potential permit complications.", "Are there any small children around?", "I don't think so, but I'm not an entomologist.", "I don't think so, but I'm not an ornithologist.", "Hey! Some of my friends are werewolves!", "Chartreuse.", "Gryphon. Don't pass up the chance to have a y and a ph in there."]

tina_answers = ["I'd recommend Denali National Park but it's quite a trek for you. Maybe make a mini-vacation out of it?", "The Loch Ness Monster has greater moral standing than some common sandwich thief. Are there any pigeons nearby? They're shady as f.", "There was an article about this in a journal I just read. Lemme find it.", "No. I went to the zoo once and I'm fairly certain they're animatronic. Still cute, though!", "Yes.", "Papayawhip", "Griffin is the American spelling."]

troll_comments = ["lame", "y'all are weird", "this site is dum", "it says fictional but you keep talking like its real", "i don't believe in these animals", "you should science more", "stop reading harry potter, wait, no, i liked that movie", "lol", "haha no", "tl;dr", "first"]

nice_comments = ["yeah, totally", "thank you for sharing!", "I never thought of that before!", "Good perspective", "+1", "Great idea!", "I agree", "Definitely", "Cool!", "Thanks for this answer! It really helped me out!"]



7.times do |n|
  question = Question.create!(title: title[n], body: body[n], user_id: rand(1..2))
  question.answers << Answer.create!(body: tom_answers[n], user_id: 1)
  question.answers[0].comments << Comment.create!(body: nice_comments.sample, user_id: 5)
  question.answers[0].comments << Comment.create!(body: troll_comments.sample, user_id: 3)
  question.answers << Answer.create!(body: tina_answers[n], user_id: 2)
  question.answers[1].comments << Comment.create!(body: nice_comments.sample, user_id: 5)
  question.answers[1].comments << Comment.create!(body: troll_comments.sample, user_id: 3)
  question.comments << Comment.create!(body: question_comments[n], user_id: 4)
end


