class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :subdomain
      t.string :user_name

      t.timestamps
    end
  end
end
