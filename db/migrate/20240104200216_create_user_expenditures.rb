class CreateUserExpenditures < ActiveRecord::Migration[6.1]
  def change
    create_table :user_expenditures do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :salary
      t.integer :bonuses
      t.integer :side_jobs
      t.timestamps
    end
  end
end
