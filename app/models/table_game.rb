class TableGame < ActiveRecord::Base
	has_one :user
	has_one :dealer
	has_many :black_jack_sessions
end
