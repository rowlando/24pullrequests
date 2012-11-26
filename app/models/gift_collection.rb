require 'values'

class GiftCollection < Value.new(:gifts)
  include Enumerable

  def each
    days.each do |day|
      date = Date.new(2012,12,day)
      gift = gifts.find { |gift| gift.date == date }

      yield(date, gift)
    end
  end

  alias :each_with_day :each

  private
  def days
    1.upto(31)
  end
end
