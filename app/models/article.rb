#your article class must inherit from the application record
class Article < ApplicationRecord
  #an article can only belong to one user
  belongs_to :user
  #validation/constraint for article creation
  #This makes sure that a title, description, and lengths of each is present in order for an article to be saved in the database
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end