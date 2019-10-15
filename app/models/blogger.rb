class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 1 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    posts.map(&:likes).sum
  end

  def best_post
    posts.max_by(&:likes)
  end
end
