class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true, presence: true
    validates :age, presence: true
    validates :bio, length: {minimum: 30}, presence: true
    validate :valid_age? 

    def valid_age?

        if age == nil || age <= 0
            errors.add(:age, "Your age must be greater then 0!")
        end
    end

    def total_likes
        posts.sum{|post|post.likes}
    end

    def featured_blog
        posts.max_by{|post| post.likes}
    end

    def featured_blog_title
        featured_blog.title
    end

    def featured_blog_likes
        featured_blog.likes
    end

    def destination_names
        destinations.map {|destination| destination.name}
    end

    def posts_by_destination(amount)
        destination_names.uniq.max_by(amount){|destination_name| destination_names.count(destination_name)}
    end

    def favourite_places(amount)
        posts_by_destination(amount).map {|name|Destination.find_destination_by_name(name)}
    end


    
    
end
