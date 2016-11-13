class BlackJackSessionsController < ApplicationController
	before_action :set_black_jack_session, only: [ :show]
	before_action :set_dealer

	
	def index
		@black_jack_sessions = BlackJackSession.all
	end

	def show

	end

	def deal
		@player_hand = []
		@dealer_hand = []
		2.times{
			random_player_card = 1 + rand(13)
			random_dealer_card = 1 + rand(13)
			@player_hand.append random_player_card
			@dealer_hand.append random_dealer_card
		}
		
		@player_value = []
		@dealer_value = []
		

		@player_hand.each do |card_val|
		    if card_val == 1
		    	@player_value.push(11)
		    elsif card_val > 10
		        @player_value.push(10)
		    else
		        @player_value.push(card_val)
		    end
		end
		
		@dealer_hand.each do |card_val|
		    if card_val == 1
		    	@dealer_value.push(11)
		    elsif card_val > 10
		        @dealer_value.push(10)
		    else
		        @dealer_value.push(card_val)
		    end
		end
		@player_total = @dealer_total = 0
		@player_total = @player_value.inject(0){|sum,x| sum + x }
		@dealer_total = @dealer_value.inject(0){|sum,x| sum + x }

		session[:player_hand] = @player_hand
	end


	def hit
		@next_card = 1 + rand(13)
		session[:player_hand].push @next_card

		@player_hand = session[:player_hand] 
		@player_value = []
		
		@player_hand.each do |card_val|
		    if card_val == 1
		    	@player_value.push(11)
		    elsif card_val > 10
		        @player_value.push(10)
		    else
		        @player_value.push(card_val)
		    end
		end
		@player_total = @player_value.inject(0){|sum,x| sum + x }	

		if @player_total <= 17
			@game_result = "OK. you still got a chance."
		elsif @player_total == 21
			@game_result = "Nice! you got 21!"
		elsif @player_total >= 18 && @player_total < 21
			@game_result = "Not Bad."
		else
			@game_result = "BUST. You lost!"		
		end	
	end

	def stand
		
	end

	def set_black_jack_session
		@black_jack_session = BlackJackSession.find params[:id]
	end

	def set_dealer
		@dealer = Dealer.first
	end

end
