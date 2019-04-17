require 'rails_helper'
require './lib/importer'

RSpec.describe ImportFromAPI do
  let(:new_import) { ImportFromAPI.new }
  let(:response) { File.read("#{::Rails.root}/spec/fixtures/gramy17.json") }
  let(:parsed_response) { JSON.parse(response) }

  before do
    stub_request(:get, "https://www.siepomaga.pl/gramy17.json?page=1").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }).
      to_return(
        status: 200,
        body: response,
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  it "initialize" do
    expect(new_import).to be_an_instance_of(ImportFromAPI)
  end

  it "imports one fundraiser to db with payments" do
    expect(Fundraiser.count).to eq 0
    expect(Payment.count).to eq 0
    new_import.run!
    expect(Fundraiser.count).to eq 1
    expect(Fundraiser.first).to have_attributes(
      title: parsed_response["title"],
      description: parsed_response["description"],
      funds_aim: parsed_response["funds_aim"],
      funds_current: parsed_response["funds_current"],
      funds_percentage: parsed_response["funds_percentage"],
      payments_total_count: parsed_response["payments_total_count"]
    )
    expect(Payment.count).to eq 25
  end
end
