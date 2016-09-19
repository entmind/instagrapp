class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  # dive14で作成・追記したよ。
  def change
    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :image_url, :string

    add_index :users, [:uid, :provider], unique: true
  end
end
