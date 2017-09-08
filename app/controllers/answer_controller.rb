get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/new'
end


post '/answers' do
  answer = Answer.new(body: params[:body], question_id: params[:question_id], user_id: current_user.id)
  if answer.save
    redirect "/questions/#{answer.question.id}/answers/#{answer.id}"
  else
    status 422
    redirect back
  end
end

get '/questions/:question_id/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  if @answer.user.id == current_user.id
    erb :'/answers/edit'
  else
    status 403
    redirect back
  end
end

put '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  if @answer.user.id == current_user.id
      @answer.update_attributes(body: params[:body])
    redirect "/questions/#{params[:question_id]}/answers/#{@answer.id}"
  else
    status 403
    redirect back
  end

end
