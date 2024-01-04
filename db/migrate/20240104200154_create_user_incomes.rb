class CreateUserIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :rent
      t.integer :utilities
      t.integer :food
      t.integer :transportation
      t.integer :phone_bills
      t.integer :internet_fees
      t.integer :medical
      t.integer :education
      t.integer :entertainment_hobbies
      t.integer :clothing
      t.integer :debt_repayment
      t.integer :miscellaneous 
      t.timestamps
    end
  end
end
