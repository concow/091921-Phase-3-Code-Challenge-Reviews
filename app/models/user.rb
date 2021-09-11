class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
    
    def favorite_product 

        self.products.sort_by {|product| product.reviews.map(&:star_rating)}.last
   
        # self.products.sort_by { |product| product.review.map(&:star_rating)}.first
    end

    def remove_reviews(product)
        # review = self.reviews.find_by_product_id(product.id)
        # review.destroy
        self.reviews
        .filter {|r| r.product.id == product.id}
        .each {|r| r.destroy}
    end
        # self.reviews.filter do |rev|
        #     if rev.product_id == product.id
        #         rev.destroy
        #     end
        # end
end

