post '/questions/:question_id/votes' do
  p params
  question = Question.find(params[:question_id])
  vote = Vote.new(value: params[:value].to_i, user: current_user, votable: question)

  if vote.save
    if request.xhr?
      content_type :json
      {vote_count: question.votes.sum(:value)}.to_json
    else
      redirect :"/questions/#{params[:question_id]}"
    end
  else
    if request.xhr?
      #display errors with ajax
    else
      #display errors with page
    end
  end
end
