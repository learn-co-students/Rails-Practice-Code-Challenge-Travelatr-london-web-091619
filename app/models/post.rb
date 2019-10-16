class Post < ApplicationRecord
  belongs_to :destination
  belongs_to :blogger

  validates :title, presence: true
  validates :content, length: { minimum: 100 }

  def add_like
    self.likes += 1
  end

  def post_blogger_name
    self.blogger.name
  end

  def post_destination_name
    self.destination.name
  end
end
