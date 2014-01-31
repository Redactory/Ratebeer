class Membership < ActiveRecord::Base
    belongs_to :user
    belongs_to :beer_club

 def to_s
#TOIMIVUUDESTA EI VARMUUTTA!!!
    "Member: #{self.user.username}"
 end
end
