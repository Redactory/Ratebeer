class Brewery < ActiveRecord::Base
    include RatingAverage

    has_many :beers, :dependent => :destroy
    has_many :ratings, :through => :beers

    validates :name, presence: true
    validates :year, numericality: {only_integer: true }

#Kokeiluvaiheessa! (TEHTY, OLETTAISIN? PITÄÄ KYSYÄ...)
    validate :date

  def date
    if year < 1042 or year > Time.now.year
	errors.add(:year, "Year must be between 1042 and #{Time.now.year}!")
    end
  end



 # Raportin tulostus metodi.
  def print_report
    puts self.name
    puts "established at year #{self.year}"
    puts "number of beers #{self.beers.count}"
    puts "number of ratings #{self.ratings.count}"
  end

 # Vuoden uudelleen asettamismetodi.
  def restart
    self.year = 2014
    puts "changed year to #{year}"
  end

 # Luokan toString-metodi.
 def to_s
    "Brewery: #{self.name}"
 end
end
