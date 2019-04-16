json.extract! payment, :id, :paid_at, :signature, :amount, :photo_url, :comment_text, :fundraiser_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
