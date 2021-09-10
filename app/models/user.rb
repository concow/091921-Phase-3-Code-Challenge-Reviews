class User < ActiveRecord::Base
    has_many :products
    has_many :reviews, through: :products
    
    def favorite_product 
      all_ratings = self.reviews.map(&:star_rating)
      all_ratings.max
    end

    def remove_reviews(product)
        self.reviews.map do |rev|
            if rev.product_id == product.id
                review.destroy
            end
        end
    end

end