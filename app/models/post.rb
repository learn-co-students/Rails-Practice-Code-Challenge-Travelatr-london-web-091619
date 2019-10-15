class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    validates :title, presence: true
    validates :content, length: {minimum: 100}

    def blogger_name
        blogger.name
    end
    
    def destination_name
        destination.name
    end
end
