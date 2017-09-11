class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user_id, {presence: true}
  validates :user_id, uniqueness: {scope: :votable, message: "You may only vote once."}
end
