class Fundraiser < ApplicationRecord
  has_many :payments, dependent: :destroy
end
