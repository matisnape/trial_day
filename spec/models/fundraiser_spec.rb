require 'rails_helper'

RSpec.describe Fundraiser do

  it "has none to begin with" do
    expect(Fundraiser.count).to eq 0
  end

  it "after creating fundraiser, there is 1 fundraiser" do
    Fundraiser.create
    expect(Fundraiser.count).to eq 1
  end

  context "fixtures" do
    fixtures :fundraisers, :payments

    it "has two fundraisers" do
      expect(Fundraiser.first).to eq fundraisers(:fundraiser_one)
      expect(Fundraiser.last).to eq fundraisers(:fundraiser_two)
    end

    it "has one fundraiser when first is deleted" do
      expect(Fundraiser.count).to eq 2
      Fundraiser.first.destroy
      expect(Fundraiser.count).to eq 1
    end

    it "each fundraiser has 2 payments" do
      expect(Fundraiser.first.payments.count).to eq 2
      expect(Fundraiser.last.payments.count).to eq 2
    end
  end
end

