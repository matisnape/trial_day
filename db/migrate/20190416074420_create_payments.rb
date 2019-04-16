class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :paid_at
      t.string :signature
      t.integer :amount
      t.string :photo_url
      t.string :comment_text
      t.references :fundraiser, foreign_key: true

      t.timestamps
    end
  end
end
