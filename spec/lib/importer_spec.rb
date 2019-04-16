require 'rails_helper'
require './lib/importer'

RSpec.describe ImportFromAPI do
  let(:new_import) { ImportFromAPI.new }

  it "initialize" do
    expect(new_import).to be_an_instance_of(ImportFromAPI)
  end

  it "imports one fundraiser to db with payments" do
    expect(Fundraiser.count).to eq 0
    expect(Payment.count).to eq 0
    new_import.run!
    expect(Fundraiser.count).to eq 1
    expect(Payment.count).to eq 25
  end
end
