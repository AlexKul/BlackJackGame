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
			random_dealer_card_suit = 1 + rand(4)

			random_dealer_card = 1 + rand(13)
			random_dealer_card_suit = 1 + rand(4)
			@player_hand.append random_player_card
			@dealer_hand.append random_dealer_card
		}
		
		@player_total = @dealer_total = 0

		@player_total = get_total(@player_hand)
		@dealer_total = get_total(@dealer_hand)

		session[:player_hand] = @player_hand
		session[:dealer_hand] = @dealer_hand
	end


	def hit
		@next_card = 1 + rand(13)
		session[:player_hand].push @next_card

		@player_hand = session[:player_hand] 
		@player_total = get_total(@player_hand)

		if @player_total <= 17
			@game_result = "ok"
		elsif @player_total == 21
			@game_result = "perfect"
		elsif @player_total >= 18 && @player_total < 21
			@game_result = "good"
		else
			@game_result = "lose"
			lose(100)		
		end	
	end

	def stand
		@player_done = true;
		
		@dealer_hand = session[:dealer_hand]
		@dealer_total = get_total(@dealer_hand)

		@player_hand = session[:player_hand]
		@player_total = get_total(@player_hand)

		while @dealer_total < 17 && !(@dealer_total > 21) do 
			random_dealer_card = 1 + rand(13)
			random_dealer_card_suit = 1 + rand(4)
			@dealer_hand.append random_dealer_card
		end

		@dealer_total = get_total(@dealer_hand)

		if @player_total > @dealer_total
			win(100)
		elsif @player_total = @dealer_total
			tie(100)
		else
			lose(100)
		end


	end

	def get_total(hand)

		@total_value = []
		hand.each do |card_val|    
		    if card_val == 1
		    	@total_value.push(11)
		    elsif card_val > 10
		        @total_value.push(10)
		    else
		        @total_value.push(card_val)
		    end
		end

		return @total_value.inject(0){|sum,x| sum + x }
		
	end

	def win(bet)
		current_user.money = current_user.money + (bet*2)
		current_user.save

	end
	
	def tie(bet)
		current_user.money = current_user.money + (bet)
		current_user.save
	end

	def lose(bet)
		current_user.money = current_user.money - (bet)
		current_user.save
	end

	def set_black_jack_session
		@black_jack_session = BlackJackSession.find params[:id]
	end

	def set_dealer
		@dealer = Dealer.first
	end

end
