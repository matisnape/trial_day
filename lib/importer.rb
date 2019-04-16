class ImportFromAPI
  BASE_URL = "https://www.siepomaga.pl/gramy17.json?page=1"

  def initialize
    @response = HTTParty.get(BASE_URL)
  end

  def run!
    new_fundraiser = Fundraiser.create(
      title: @response["title"],
      description: @response["description"],
      funds_aim: @response["funds_aim"],
      funds_current: @response["funds_current"],
      funds_percentage: @response["funds_percentage"],
      payments_total_count: @response["payments_total_count"]
    )
    payments = @response["payments"]
    payments.each do |payment|
      Payment.create(
        paid_at: payment["paid_at"],
        signature: payment["signature"],
        amount: payment["amount"],
        photo_url: payment["photo_url"],
        comment_text: payment["comment_text"],
        fundraiser_id: new_fundraiser.id
      )
    end
  end
end
