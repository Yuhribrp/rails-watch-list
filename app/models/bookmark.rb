class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 4 }
  validates :movie_id, uniqueness: { scope: :list_id, massage: "Already Exists"}
end
