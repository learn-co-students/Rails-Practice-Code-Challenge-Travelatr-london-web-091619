class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts(amount)
        posts.last(amount)
    end

    def most_liked_post
        posts.max_by{|post| post.likes}
    end

    def most_liked_post_title
        most_liked_post.title
    end
    
    def most_liked_post_likes
        most_liked_post.likes
    end

    def average_blogger_age
        bloggers.sum{|blogger|blogger.age}.to_f/bloggers.length
    end

    def self.find_destination_by_name(name)
        all.find_by(name: name)
    end
end
