class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name, default: 'unknown'
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.timestamps null: false
    end
  end
end
