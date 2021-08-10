class Post < ApplicationRecord
  validates :title, presence: true, filter_words: ["javascript"]
  validates :body, presence: true, filter_words: ["javascript"]
end
