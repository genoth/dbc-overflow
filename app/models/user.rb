class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :email, :username, {presence: true, uniqueness: true}
end
