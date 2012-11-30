class UsersController < ApplicationController
  def show
    user     = User.find(params[:id])
    calendar = Calendar.new(Gift.giftable_dates, user.gifts)

    render :show, :locals => { :user => user, :calendar => calendar }
  end
end
