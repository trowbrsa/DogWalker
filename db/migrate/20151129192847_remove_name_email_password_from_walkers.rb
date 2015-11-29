class RemoveNameEmailPasswordFromWalkers < ActiveRecord::Migration
  def change
    remove_column :walkers, :name, :string
    remove_column :walkers, :email, :string
    remove_column :walkers, :password_digest, :string
  end
end
