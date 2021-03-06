class User < ActiveRecord::Base
  has_many :ratings, dependent: :destroy  # käyttäjällä monta ratingia, poistetetaan käyttäjän mukana.
  has_many :beers, through: :ratings
  has_many :memberships
  #has_many :beer_clubs, through :memberships

    include RatingAverage

    has_secure_password

    # Käyttäjätunnarin validointi ja sen minimipituuden tarkistus.
    validates :username, uniqueness: true
    validates_format_of :password, :multiline => true, :with => /^(?=.*[A-Z])(?=.*[0-9]).{4,15}$/

#EI TIETOA JOS VIELÄ TARPEEN!!! , length: { minimum: 4, maximum: 15 }

# Regex tehtävään 10:  /^(?=.*[A-Z])(?=.*[0-9]).{4,15}$/

end
