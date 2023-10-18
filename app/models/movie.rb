class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  has_many :bookmarks

  before_destroy :check_for_bookmarks
  has_one_attached :photo

  private

  def check_for_bookmarks
    if bookmarks.any?
      raise ActiveRecord::InvalidForeignKey, "Cannot delete a movie with associated bookmarks"
    end
  end
end
