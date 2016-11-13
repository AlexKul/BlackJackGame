class CreateTableGames < ActiveRecord::Migration
  def change
    create_table :table_games do |t|
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.timestamps null: false
    end
  end
end
