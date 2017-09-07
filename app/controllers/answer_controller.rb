
get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/new'
end


post '/answers' do
  answer = Answer.create(body: params[:body], question_id: params[:question_id], user_id: 1)
  if answer.save
    redirect "/questions/#{answer.question.id}/answers/#{answer.id}"
  else
    status 422
    redirect back
  end
end

