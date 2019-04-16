class CreateFundraisers < ActiveRecord::Migration[5.2]
  def change
    create_table :fundraisers do |t|
      t.string :title
      t.text :description
      t.integer :funds_aim
      t.integer :funds_current
      t.integer :funds_percentage
      t.integer :payments_total_count

      t.timestamps
    end
  end
end
