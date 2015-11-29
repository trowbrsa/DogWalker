class RemoveNameEmailPasswordFromOwners < ActiveRecord::Migration
  def change
    remove_column :owners, :name, :string
    remove_column :owners, :email, :string
    remove_column :owners, :password_digest, :string
  end
end
