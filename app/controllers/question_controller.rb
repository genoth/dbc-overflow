
get '/questions/new' do
  erb :'/questions/new'
end



post '/questions' do
  question = Question.create(title: params[:question], body: params[:body], user_id: current_user)
  if question.save
    redirect "/questions/#{question.id}"
  else
    status 422
    redirect "/questions/new"
  end
end

