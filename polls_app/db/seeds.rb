# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

ActiveRecord::Base.transaction do
  user = User.create!(username: "drew")
  user2 = User.create!(username: "cindy")
  user3 = User.create!(username: "ebear")

  poll = Poll.create!(title: "what title", user_id: user2.id)
  poll2 = Poll.create!(title: "Whats your poll?", user_id: user.id)

  q1 = Question.create!(text: "something crazy Idk", poll_id: poll.id)
  q2 = Question.create!(text: "something creative", poll_id: poll.id)
  
  a1 = AnswerChoice.create!(text: "I agree", question_id: q1.id)
  a2 = AnswerChoice.create!(text: "I disagree", question_id: q2.id)

  r1 = Response.create!(user_id: user.id, answer_choice_id: a1.id)
  r2 = Response.create!(user_id: user2.id, answer_choice_id: a2.id)
  r3 = Response.create!(user_id: user3.id, answer_choice_id: a1.id)
  r4 = Response.create!(user_id: user3.id, answer_choice_id: a2.id)
end