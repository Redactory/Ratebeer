class Brewery < ActiveRecord::Base
    has_many :beers, :dependent => :destroy
    has_many :ratings, :through => :beers

    include RatingAverage

 # Metodi panimoon liittyvien oluiden arvosteluiden keskiarvon laskemiseksi.
# def average_rating
# ratings.average(:score)
# end

 # Luokan toString-metodi.
 def to_s
    "Brewery: #{self.name}"
 end
end
