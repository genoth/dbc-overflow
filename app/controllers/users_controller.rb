get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.authenticate(params[:email], params[:username])
  if @user
    redirect '/'
  else
    status 422
    erb :'users/new'
  end
end