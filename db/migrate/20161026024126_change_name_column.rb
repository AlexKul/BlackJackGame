class ChangeNameColumn < ActiveRecord::Migration
  def change
  	change_column :users, :name, :string, default: "" 
  end
end
