class ChangePasswordToPassworddigest < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :passhash, :password_digest
  end
end
