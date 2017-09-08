get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

post '/questions' do
  question = Question.create(title: params[:title], body: params[:body], user_id: current_user.id)
  if question.save
    redirect "/questions/#{question.id}"
  else
    status 422
    redirect back
  end
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  if @question.user.id == current_user.id
    erb :'/questions/edit'
  else
    status 403
    redirect back
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.user.id == current_user.id
      @question.update_attributes(title: params[:title], body: params[:body])
    redirect "/questions/#{@question.id}"
  else
    status 403
    redirect back
  end

end

