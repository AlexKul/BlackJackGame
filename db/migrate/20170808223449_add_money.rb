class AddMoney < ActiveRecord::Migration
  def change
  	add_column :users, :money, :decimal
  end
end
