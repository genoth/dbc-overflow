post '/questions/:question_id/votes' do
  question = Question.find(params[:question_id])
  @vote = Vote.new(value: params[:value].to_i, user: current_user, votable: question)

  if @vote.save
    if request.xhr?
      content_type :json
      {vote_count: question.votes.sum(:value)}.to_json
    else
      redirect :"/questions/#{params[:question_id]}"
    end
  else
    status 422
    if request.xhr?
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    else
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    end
  end
end

post '/questions/:question_id/comments/:comment_id/votes' do
  comment = Comment.find(params[:comment_id])
  @vote = Vote.new(value: params[:value].to_i, user: current_user, votable: comment)

  if @vote.save
    if request.xhr?
      content_type :json
      {vote_count: comment.votes.sum(:value)}.to_json
    else
      redirect :"/questions/#{params[:question_id]}"
    end
  else
    status 422
    if request.xhr?
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    else
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    end
  end
end

post '/answers/:answer_id/votes' do
  answer = Answer.find(params[:answer_id])
  @vote = Vote.new(value: params[:value].to_i, user: current_user, votable: answer)

  if @vote.save
    if request.xhr?
      content_type :json
      {vote_count: answer.votes.sum(:value)}.to_json
    else
      redirect :"/questions/#{params[:question_id]}"
    end
  else
    status 422
    if request.xhr?
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    else
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    end
  end
end

post '/answers/:answer_id/comments/:comment_id/votes' do
  answer = Answer.find(params[:answer_id])
  @vote = Vote.new(value: params[:value].to_i, user: current_user, votable: answer)

  if @vote.save
    if request.xhr?
      content_type :json
      {vote_count: answer.votes.sum(:value)}.to_json
    else
      redirect :"/questions/#{params[:question_id]}"
    end
  else
    status 422
    if request.xhr?
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    else
      erb :'partials/_errors', layout: false, locals: {errors: @vote.errors.full_messages}
    end
  end

end






