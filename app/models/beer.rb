class Beer < ActiveRecord::Base
    belongs_to :brewery
    has_many :ratings, :dependent => :destroy
    has_many :raters, -> { uniq }, through: :ratings, source: :user

    include RatingAverage

    validates :name, presence: true
    

# def average_rating
  #return b.ratings.inject(0) {|result, rating| result+rating.score} LASKEE REITTAUSTEN SUMMAN!!!
#  return self.ratings.average(:score)	#Palauttaa reittausten keskiarvon.
# end

 #Oluen toString-metodi.

 def to_s
    "Beer: #{self.name}, Brewery: #{brewery.name}"
 end


end
