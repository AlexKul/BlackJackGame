class CreateBlackJackSessions < ActiveRecord::Migration
  def change
    create_table :black_jack_sessions do |t|
      t.integer :player_total, default: 0
      t.integer :dealer_total, default: 0
      t.timestamps null: false
    end
  end
end
