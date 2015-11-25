class AddPasswordToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :password_digest, :string
  end
end
