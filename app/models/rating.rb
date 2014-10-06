class Rating < ActiveRecord::Base
  belongs_to :user
  validates :value, :presence => true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
end
