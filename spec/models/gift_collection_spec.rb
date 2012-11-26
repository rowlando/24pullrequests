require File.expand_path('../../../app/models/gift_collection', __FILE__)

describe GiftCollection do
  it "returns all the days of december regardless of the incoming array" do
    GiftCollection.new([]).count.should == 31
    GiftCollection.new([]).each_with_day do |day, gift|
      gift.should be_nil
      day.should be_instance_of(Date)
    end
  end

  it "yields the right gift for the right day" do
    the_first  = mock('gift', :date => Date.parse('2012-12-1'))
    the_fourth = mock('gift', :date => Date.parse('2012-12-4'))
    the_end    = mock('gift', :date => Date.parse('2012-12-24'))

    gifts = [the_end, the_fourth, the_first]

    sorted_gifts = GiftCollection.new(gifts).map { |day, gift| [day, gift] }
    sorted_gifts[0].should  == [Date.parse('2012-12-1'), the_first]
    sorted_gifts[3].should  == [Date.parse('2012-12-4'), the_fourth]
    sorted_gifts[23].should == [Date.parse('2012-12-24'), the_end]
  end
end
