class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :description, length: { minimum: 2 }
end