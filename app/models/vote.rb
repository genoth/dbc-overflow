class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user_id, presence: {message: "must be logged in to vote!"}
  validates :user_id, uniqueness: {scope: :votable, message: "You may only vote once."}
end
