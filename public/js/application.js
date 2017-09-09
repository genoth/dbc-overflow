$(document).ready(function() {
  questionVoteListener();
  answerVoteListener();
  qCommentVoteListener();
  aCommentVoteListener();
});

var questionVoteListener = function(){
  $("div.question").on("submit", ".question-vote", function(e){
    e.preventDefault();
    console.log("bound")
    var $questionDiv = $("div.question")
    var $form = $(this);
    var url = $form.attr('action');

    var $request = $.ajax({
      url: url,
      method: "post",
      dataType: "json",
      data: $form.serialize()
    })
    $request.done(function(serverResponse){
      var $voteSpan = $questionDiv.find(".vote-count")
      $voteSpan.text(serverResponse.vote_count)
    })
  })
}

var answerVoteListener = function(){
$("div.question_answers").on("submit", ".answer-vote", function(e){
    e.preventDefault();
    console.log("bound")
    var $answerDiv = $("div.question_answers")
    var $form = $(this);
    var url = $form.attr('action');

    var $request = $.ajax({
      url: url,
      method: "post",
      dataType: "json",
      data: $form.serialize()
    })
    $request.done(function(serverResponse){
      var $voteSpan = $answerDiv.find(".vote-count")
      $voteSpan.text(serverResponse.vote_count)
    })
  })
}

var qCommentVoteListener = function(){

}

var aCommentVoteListener = function(){

}
