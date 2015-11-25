class CreateWalkers < ActiveRecord::Migration
  def change
    create_table :walkers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :availability
      t.string :bio

      t.timestamps null: false
    end
  end
end
