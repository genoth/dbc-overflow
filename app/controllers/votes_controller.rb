post '/questions/:question_id/votes' do
  @vote = Vote.new(value: params[:value].to_i, user_id: current_user.id, votable_type: "Question", votable_id: params[:question_id])
  if @vote.save
    if request.xhr?

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
