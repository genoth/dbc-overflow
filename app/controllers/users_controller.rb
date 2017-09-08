get '/users/new' do
  if current_user
    status 418
    redirect '/questions'
  else
    erb :'users/new'
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    status 422
    erb :'users/new'
  end
end
