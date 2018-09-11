require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(password: "some_password", email: "john@doe.com") }

  describe "Validations" do
    it "is valid with valid attributes" do
      except(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      except(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      except(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      except(subject).to_not be_valid
    end


end

end
