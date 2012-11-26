require 'spec_helper'

describe User do
  it "searches it's gifts by date" do
    gifts = mock('gifts', :find => mock('gift'))
    date  = Date.parse('2012-12-1')

    user = User.new
    user.stub(:gifts => gifts)
    gifts.should_receive(:find).with(user, date)

    user.gift_for(date)
  end
end
