class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :email, :username, {presence: true, uniqueness: true}

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(input_password)
    @password = BCrypt::Password.create(input_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
