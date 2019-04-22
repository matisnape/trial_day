require 'rails_helper'

RSpec.describe Fundraiser, type: :model do

  it { should have_many(:payments) }

  it "after creating fundraiser, there is 1 fundraiser" do
    expect { Fundraiser.create }
      .to change { Fundraiser.count }.by 1
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
      expect(Fundraiser.first.payments.count).to eq 1
      expect(Fundraiser.last.payments.count).to eq 3
    end
  end
end

