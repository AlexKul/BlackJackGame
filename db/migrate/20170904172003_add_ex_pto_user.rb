class AddExPtoUser < ActiveRecord::Migration
  def change
  	add_column :users, :experience, :int
  end
end
