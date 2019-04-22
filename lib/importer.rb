class ImportFromAPI
  BASE_URL = "https://www.siepomaga.pl/gramy17.json"

  def initialize
    @response = HTTParty.get(BASE_URL + "?page=1")
    @payments = []
  end

  def run!
    @fundraiser = Fundraiser.create(
      title: @response["title"],
      description: @response["description"],
      funds_aim: @response["funds_aim"],
      funds_current: @response["funds_current"],
      funds_percentage: @response["funds_percentage"],
      payments_total_count: @response["payments_total_count"]
    )
    get_all_payments
    save_payments_to_db(@payments)
  end

  private

  def number_of_payments_pages
    @response["payments_total_pages"]
  end

  def get_payments_from_page(page)
    resp = HTTParty.get(BASE_URL + "?page=#{page}")
    resp["payments"]
  end

  def append_page_payments_to_payments(page_payments)
    @payments.append(page_payments)
  end

  def get_all_payments
    (1..number_of_payments_pages).each do |page|
      resp = get_payments_from_page(page)
      append_page_payments_to_payments(resp)
      puts "Appended page #{page}"
    end
    @payments.flatten
  end

  def save_payments_to_db(payments)
    payments.each do |payment|
      Payment.create(
        paid_at: payment["paid_at"],
        signature: payment["signature"],
        amount: payment["amount"],
        photo_url: payment["photo_url"],
        comment_text: payment["comment_text"],
        fundraiser_id: @fundraiser.id
      )
    end
  end
end
