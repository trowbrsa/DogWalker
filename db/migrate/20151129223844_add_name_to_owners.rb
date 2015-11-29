class AddNameToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :first_name, :string
    add_column :owners, :last_name, :string
  end
end
