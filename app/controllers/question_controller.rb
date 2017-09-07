
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  p params[:body]
  question = Question.create(title: params[:title], body: params[:body], user_id: 1)
  if question.save
    redirect "/questions/#{question.id}"
  else
    status 422
    redirect back
  end
end
