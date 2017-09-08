# get a form for a new comment (on a question)
get '/questions/:question_id/comments/new' do
  if current_user
    @question = Question.find(params[:question_id])
    erb :'/comments/new-q'
  else
    status 403
    redirect back
  end
end

# send the form to create a new comment (on a question)
post '/questions/:question_id/comments' do
  @comment = Comment.new(
    body: params[:body],
    user_id: current_user.id,
    commentable_type: "Question",
    commentable_id: params[:question_id]
    )
  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @comment.errors
    erb :'/comments/new-q'
  end
end

# get a form for a new comment (on an answer)
get '/answers/:answer_id/comments/new' do
  if current_user
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(@answer.question_id)
    erb :'/comments/new-a'
  else
    status 403
    redirect back
  end
end

# send the form to create a new comment (on an answer)
post '/answers/:answer_id/comments' do
  answer = Answer.find(params[:answer_id])
  question = Question.find(answer.question_id)
  @comment = Comment.new(
    body: params[:body],
    user_id: current_user.id,
    commentable_type: "Answer",
    commentable_id: params[:answer_id]
    )
  if @comment.save
    redirect "/questions/#{question.id}"
  else
    @errors = @comment.errors
    erb :'/comments/new-a'
  end
end


# post '/questions/:question_id/comments' do
#   @comment = Comment.new(merge_params)
# end

# def merge_params
#   params.merge({user: current_user})
# end
