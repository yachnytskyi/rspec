require 'rails_helper'

RSpec.describe Auction, :type => :model do
  subject {
    described_class.new(title: "Anything", description: "Lorem ipsum",
                      start_date: DateTime.now, end_date: DateTime.now + 1.week)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end

  it 'cannot create a bid if its an equal amount as the last bid' do
  seller = User.create(:email => 'jane@doe.com', :password => 'pw1234',
  :password_confirmation => 'pw1234')
  bidder = User.create(:email => 'john@doe.com', :password => 'pw1234',
  :password_confirmation => 'pw1234')

  auction = Auction.create(title: 'Anything', description: 'Lorem ipsum',
            start_date: DateTime.now, end_date: DateTime.now + 1.week,
            seller_id: seller.id)

  described_class.bid!(auction, 100, bidder)
  expect(auction.errors).to be_empty

  described_class.bid!(auction, 100, bidder)
  expect(auction.errors[:bid].first).to eq
end 

  describe "Associations" do
    it { should belong_to(:buyer) }
    it { should belong_to(:seller) }
    it { should have_many(:bids) }
end

  let(:seller) { User.new(:email => "jane@doe.com", :password => "pw1234",
                        :password_confirmation => "pw1234") }
  subject {
  described_class.new(title: "Anything", description: "Lorem ipsum",
                    start_date: DateTime.now, end_date: DateTime.now + 1.week,
                    seller: seller)
}






end
