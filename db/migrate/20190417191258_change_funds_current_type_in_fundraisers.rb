class ChangeFundsCurrentTypeInFundraisers < ActiveRecord::Migration[5.2]
  def self.up
    change_column :fundraisers, :funds_current, :decimal, precision: 20, scale: 2
    change_column :payments, :amount, :decimal, precision: 20, scale: 2
  end

  def self.down
    change_column :fundraisers, :funds_current, :integer
    change_column :payments, :amount, :integer
  end
end
