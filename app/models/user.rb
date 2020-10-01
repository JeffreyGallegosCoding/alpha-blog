class User < ApplicationRecord
  #Before each user email is saved all letters are put in lower case
  before_save { self.email = email.downcase }
  #part of the one to many relationship one user has many articles.
  has_many :articles
  # validates the presence of the username before user object is saved to database
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end