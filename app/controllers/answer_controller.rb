get '/questions/:id/answers/new' do
  if current_user
    @question = Question.find_by(id: params[:id])
    erb :'/answers/new'
  else
    status 403
    redirect back
  end
end


post '/answers' do
  answer = Answer.new(body: params[:body], question_id: params[:question_id], user_id: current_user.id)
  if answer.save
    redirect "/questions/#{answer.question.id}"
  else
    status 422
    redirect back
  end
end

get '/questions/:question_id/answers/:id/edit' do
  if current_user
    @answer = Answer.find(params[:id])
    @question = @answer.question
    if @answer.user.id == current_user.id
      erb :'/answers/edit'
    else
      status 403
      redirect back
    end
  else
    status 403
    redirect back
  end
end

put '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  if @answer.user.id == current_user.id
      @answer.update_attributes(body: params[:body])
    redirect "/questions/#{params[:question_id]}"
  else
    status 403
    redirect back
  end
end

delete '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  if @answer.user.id == current_user.id
      @answer.destroy
    redirect "/questions/#{params[:question_id]}"
  else
    status 403
    redirect back
  end
end
