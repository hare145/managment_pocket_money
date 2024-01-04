class CreateUsersMoneys < ActiveRecord::Migration[6.1]
  def change
    create_table :users_moneys do |t|

      t.timestamps
    end
  end
end
