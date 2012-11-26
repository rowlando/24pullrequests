class GiftsController < ApplicationController
  def index
    gift_collection = GiftCollection.new(current_user.gifts)
    gift_form       = GiftForm.new(:gift => current_user.new_gift,
                                   :pull_requests => current_user.pull_requests,
                                   :giftable_dates => Gift.giftable_dates)

    render :index, :locals => { :gift_collection => gift_collection,
                                :gift_form       => gift_form }
  end

  def create
    pull_request = current_user.pull_requests.find_by_id(pull_request_id)
    gift_params  = post_params.merge(:pull_request => pull_request)
    gift         = current_user.new_gift(gift_params)

    if gift.save
      flash[:notice] = "Your code has been gifted."
      redirect_to gifts_path()
    else
      gift_form = GiftForm.new(:gift => gift,
                               :pull_requests => current_user.pull_requests,
                               :giftable_dates => Gift.giftable_dates)

      render :new, :locals => { :gift_form => gift_form }
    end
  end

  private
  def pull_request_id
    params[:gift][:pull_request_id]
  end

  def post_params
    params[:gift].slice(:date)
  end
end
