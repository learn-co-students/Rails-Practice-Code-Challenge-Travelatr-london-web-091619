class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def average_age
    bloggers.uniq.map(&:age).sum / bloggers.uniq.count
  end

  def recent_posts(num)
    posts.max_by(num) { |post| post.created_at }
  end
end
