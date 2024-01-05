class CreateUserOcrs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_ocrs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :text
      t.timestamps
    end
  end
end
