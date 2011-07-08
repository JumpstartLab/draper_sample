class ChangeCustomerIdToUserIdInOrders < ActiveRecord::Migration
  def self.up
    rename_column :orders, :customer_id, :user_id
  end

  def self.down
    rename_column :orders, :user_id, :customer_id
  end
end
