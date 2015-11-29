class AddUserIdToWalkers < ActiveRecord::Migration
  def change
    add_column :walkers, :user_id, :integer
  end
end
