class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        return Review.create(star_rating: star_rating, comment: comment, product_id: self.id, user_id: user.id)
    end

    #  def print_all_reviews 
    #     self.reviews.map do |review|
    #         review.print_review 
    #     end
    # end
    def print_all_reviews
        self.reviews.map(&:print_review)
    end

    def average_rating
        self.reviews.sum(&:star_rating).to_f/self.reviews.size
    end

end