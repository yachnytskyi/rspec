class Bid < ApplicationRecord
  belong_to :bidder, class_name: "User"

  validate_presence_of :bidder
end
