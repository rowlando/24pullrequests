class Gift < ActiveRecord::Base
  attr_accessible :user, :pull_request, :date

  belongs_to :user
  belongs_to :pull_request

  validates :date, :uniqueness => { :scope => :user_id,
                                    :message => "You only need one gift per day. Save it for tomorrow!" }

  def self.find(user, date)
    where(:user_id => user.id, :date => date).first
  end

  def to_param
    date.to_s
  end
end
