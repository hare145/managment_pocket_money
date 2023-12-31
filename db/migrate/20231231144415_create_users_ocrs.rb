class CreateUsersOcrs < ActiveRecord::Migration[6.1]
  def change
    create_table :users_ocrs do |t|
      t.string :text

      t.timestamps
    end
  end
end
