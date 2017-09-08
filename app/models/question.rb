class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user

  validates :body, :title, {presence: true}

  def best_answer
    self.answers.find_by("id = ?", self.best_answer_id)
  end

end
