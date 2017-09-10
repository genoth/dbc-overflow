class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user

  validates :body, :title, {presence: true}

  def best_answer
    self.answers.find_by(id: self.best_answer_id)
  end

  def best_answer=(answer_id)
    if question.user.id == current_user.id
      self.best_answer_id = answer_id
    end
  end

  def vote_score
    if self.votes.length == 0
      return 0
    else
      self.votes.sum(:value)
    end
  end
end
