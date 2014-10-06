class RatingsController < ApplicationController

before_filter :authenticate_user!

def index
  @rating = current_user.rating
end

end
