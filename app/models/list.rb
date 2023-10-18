class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  before_destroy :destroy_child_saved_movies
  has_one_attached :photo

  private

  def destroy_child_saved_movies
    movies.destroy_all
  end
end
