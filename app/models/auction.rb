class Auction < ActiveRecord::Base
  belongs_to :buyer, class_name: "User", optional: true # Rails 5!
  belongs_to :seller, class_name: "User"
  has_many :bids

  validates_presence_of :title, :description, :start_date, :end_date
end
