class CreateTwitterAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :twitter_accounts do |t|
      t.string :uid, null: false
      t.string :screen_name, null: false
      t.string :name, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
