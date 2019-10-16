class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def last_five
    self.posts.last(5)
  end

  def average_age
    all_ages = self.bloggers.map(&:age).uniq
    all_ages.sum  / all_ages.length
  end

  def featured_post
    self.posts.order(likes: :desc)[0]
  end
end
