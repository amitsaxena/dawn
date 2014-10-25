class RatingsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @rating = current_user.rating
  end

  def create
    render :json => {:error => "Invalid request!"}.to_json and return if params[:rating].blank?
    @rating = current_user.rating
    if @rating
      @rating.value = params[:rating].to_i
      @rating.save!
    else
      Rating.create!(:value => params[:rating].to_i, :user_id => current_user.id)
    end
    render :json => {:success => true}.to_json and return
  end

end
