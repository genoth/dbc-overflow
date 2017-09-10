$(document).ready(function() {
  questionVoteListener();
  answerVoteListener();
  qCommentVoteListener();
  aCommentVoteListener();
});

var voteHandler = function($form, $votableDiv){
  var $request = $.ajax({
    url: $form.attr('action'),
    method: "post",
    dataType: "json",
    data: $form.serialize()
  })
  $request.done(function(serverResponse){
    var $voteSpan = $votableDiv.find(".vote-count")
    $voteSpan.text(serverResponse.vote_count)
  })
}

var questionVoteListener = function(){
  $("div.question").on("submit", ".question-vote", function(e){
    e.preventDefault();
    console.log("bound")
    var $votableDiv = $("div.question")
    var $form = $(this);

    voteHandler($form, $votableDiv);
  })
}

var answerVoteListener = function(){
  $("div.question_answers").on("submit", ".answer-vote", function(e){
    e.preventDefault();
    console.log("bound")
    var $votableDiv = $("div.question_answers")
    var $form = $(this);

    voteHandler($form, $votableDiv);
  })
}

var qCommentVoteListener = function(){
  $("div.question_comments").on("submit", ".q-comment-vote", function(e){
    e.preventDefault();
    console.log("bound")
    var $votableDiv = $("div.question_comments")
    var $form = $(this);

    voteHandler($form, $votableDiv);
  })
}

var aCommentVoteListener = function(){
  $("div.question").on("submit", ".a-comment-vote", function(e){
    e.preventDefault();
    console.log("bound")
    var $votableDiv = $("div.answer_comments")
    var $form = $(this);

    voteHandler($form, $votableDiv);
  })
}
