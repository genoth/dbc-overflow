get '/questions/:question_id/votes' do
  @vote = Vote.new(value: params[:value].to_i, user_id: current_user.id, votable_type: "Question", votable_id: params[:question_id])
  current_votes =
  if @vote.save
    if request.xhr?
      # do the ajax thing
    else

    end
  else
    if request.xhr?
      #display errors with ajax
    else
      #display errors with page
    end
  end
end
