class AddNameInfoToWalkers < ActiveRecord::Migration
  def change
    add_column :walkers, :first_name, :string
    add_column :walkers, :last_name, :string
  end
end
