json.extract! fundraiser, :id, :title, :description, :funds_aim, :funds_current, :funds_percentage, :payments_total_count, :created_at, :updated_at
json.url fundraiser_url(fundraiser, format: :json)
