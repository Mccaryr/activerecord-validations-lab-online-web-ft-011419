class Post < ActiveRecord::Base

    validates :title, presence: true 
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 100 }
    validates :category, inclusion: { in: %w(Fiction)}
    validate :clickbait? 


    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i
    ]


    def clickbait?
         if CLICKBAIT_PATTERNS.none? {|pattern| pattern.match title}
            errors.add(:title, "must be clickbait")
         end 
    end 
end


