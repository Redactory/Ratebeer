class ApplicationController < ActionController::Base
  protect_from_forgery

  # määritellään, että metodi current_user tulee käyttöön myös näkymissä
  helper_method :current_user

  def current_user
# Poista sessio-viittaukset jos sessioon liittyvä user_id on nil eli käyttäjää ei enää ole olemassa.
  #  if User.user_id.nil?
   #   session[:user_id] = nil
      # uudelleenohjataan sovellus pääsivulle 
    #  redirect_to :root
  #  end

    return nil if session[:user_id].nil? 
    User.find(session[:user_id])
  end

end
