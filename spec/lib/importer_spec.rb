require 'rails_helper'
require './lib/importer'

RSpec.describe ImportFromAPI do
  let(:new_import) { ImportFromAPI.new }
  let(:response) { File.read("#{::Rails.root}/spec/fixtures/gramy17.json") }
  let(:parsed_response) { JSON.parse(response) }
  let(:payments) { parsed_response["payments"] }

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
    expect { new_import.run! }
      .to change { Fundraiser.count }.by(1)
      .and change { Payment.count }.by(payments.count)

    expect(Fundraiser.first).to have_attributes(
      parsed_response.slice(
        "title", "description",
        "funds_aim", "funds_current", "funds_percentage",
        "payments_total_count"
      )
    )
    db_payments = Fundraiser.first.payments.to_a
    db_payments.each_with_index do |db_payment, idx|
      expect(db_payment).to have_attributes(
        payments[idx].slice("paid_at", "signature", "amount", "photo_url", "comment_text")
      )
    end
  end
end
