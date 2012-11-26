require 'spec_helper'
require 'ostruct'

describe User do
  fixtures :users

  subject(:user) { User.find('clowder') }

  it "creates new gifts that belong to itself" do
    user.new_gift.user.should == user
  end

  it "forwards attributes to newly created gifts" do
    gift_factory = ->(attrs) { OpenStruct.new(attrs) }
    user.gift_factory = gift_factory

    user.new_gift(:foo => 'bar').foo.should == 'bar'
  end
end
