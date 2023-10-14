class Bookmark < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: "Bookmark already exists for this movie and list" }

  belongs_to :movie
  belongs_to :list
end
