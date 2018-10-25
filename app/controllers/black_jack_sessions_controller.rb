class BlackJackSessionsController < ApplicationController
	before_action :set_black_jack_session, only: [ :show]
	before_action :set_dealer

	
	def index
		@black_jack_sessions = BlackJackSession.all

		@day_passed = (DateTime.now.to_time.to_i - current_user.current_sign_in_at.to_i).abs/86400 > 1
	end

	def show
		@userLevel = UserController.getLevel(current_user)
	end

	def deal
		session[:bet] = params['bet']
		PlayBet(session[:bet].to_i)

		@player_hand = []
		@dealer_hand = []

		2.times{
			random_player_card_value = 1 + rand(13)
			random_player_card_suit = 1 + rand(4)

			player_card = {'suit' => random_player_card_suit, 'value' => random_player_card_value}

			random_dealer_card_value = 1 + rand(13)
			random_dealer_card_suit = 1 + rand(4)

			dealer_card = {'suit' => random_dealer_card_suit, 'value' => random_dealer_card_value}

			#for getting the suit together
			@player_hand.append player_card
			@dealer_hand.append dealer_card

		}
		
		@player_total = @dealer_total = 0

		@player_total = get_total(@player_hand)
		@dealer_total = get_total(@dealer_hand)

		session[:player_hand] = @player_hand
		session[:dealer_hand] = @dealer_hand

		@userLevel = UserController.getLevel(current_user)
	end


	def hit
		random_player_card_value = 1 + rand(13)
		random_player_card_suit = 1 + rand(4)

		@next_card = Hash["suit" => random_player_card_suit, "value" => random_player_card_value]

		session[:player_hand].push @next_card

		player_hand = session[:player_hand] 
		@player_total = get_total(player_hand)

		if @player_total <= 17
			@game_result = "ok"
		elsif @player_total == 21
			@game_result = "perfect"
		elsif @player_total >= 18 && @player_total < 21
			@game_result = "good"
		else
			@game_result = "Bust"
			@player_done = true;		
		end	
	end

	def double
		@player_done = true;
		
		random_player_card_value = 1 + rand(13)
		random_player_card_suit = 1 + rand(4)
		
		@next_card = Hash["suit" => random_player_card_suit, "value" => random_player_card_value]

		session[:player_hand].push @next_card

		@player_hand = session[:player_hand] 
		@player_total = get_total(@player_hand)

		if @player_total <= 17
			@game_result = "ok"
		elsif @player_total == 21
			@game_result = "perfect"
		elsif @player_total > 17 && @player_total < 21
			@game_result = "good"
		else
			@game_result = "Bust"
			@player_done = true;		
		end	

		PlayBet(session[:bet].to_i)

		find_winner('double', session[:bet].to_i)

		@userLevel = UserController.getLevel(current_user)
	end

	def stand
		@player_done = true;
		
		@dealer_hand = session[:dealer_hand]
		@player_hand = session[:player_hand] 

		@dealer_total = get_total(@dealer_hand)
		@player_total = get_total(@player_hand)

		find_winner('normal', session[:bet].to_i)

		@userLevel = UserController.getLevel(current_user)
	end

	def get_total(hand)

		@total_value = []
		cards = hand.map {|c| c['value'].to_i}.sort.reverse
		cards.each do |card| 
		    @total_value.push(
		    	if card == 1 && (@total_value.sum + 11) <= 21 then 11
		    	elsif card == 1 then 1
		    	elsif card > 10 then 10
		    	else card end
		    )
		end

		return @total_value.sum
		
	end

	def find_winner(action, bet)

		@dealer_hand = session[:dealer_hand]
		@dealer_total = get_total(@dealer_hand)

		while @dealer_total < 17 do 
			random_dealer_card_value = 1 + rand(13)
			random_dealer_card_suit = 1 + rand(4)

			@next_card = Hash["suit" => random_dealer_card_suit, "value" => random_dealer_card_value]

			session[:dealer_hand].push @next_card
			@dealer_hand = session[:dealer_hand]

			@dealer_total = get_total(@dealer_hand)
		end

		

		if @player_total > @dealer_total && @player_hand.count < 3 && @player_total == 21
			BJwin(bet)
			UserController.addExperience(bet, current_user)
			@game_result = "BlackJack!"
		elsif @player_total > @dealer_total && action == 'double' 
			doubleWin(bet)
			UserController.addExperience(bet, current_user)
			@game_result = "Double Win!"
		elsif @player_total > @dealer_total || @dealer_total > 21
			win(bet)
			UserController.addExperience(bet, current_user)
			@game_result = "Win"
		elsif @player_total == @dealer_total
			tie(bet)
			@game_result = "Tied"
		else 
			@game_result = "Dealer Wins"
		end	
	end


	def BJwin(bet)
		current_user.money += bet*3/2
		current_user.save
		@amount = "+$" + (bet*3/2).to_s
	end
	
	def doubleWin(bet)
		current_user.money += bet*4
		current_user.save
		@amount = "+$" + (bet*4).to_s
	end

	def win(bet)
		current_user.money += bet*2
		current_user.save
		@amount = "+$" + (bet*2).to_s
	end
	
	def tie(bet)
		current_user.money += bet
		current_user.save
		@amount = "+$" + bet.to_s
	end

	def PlayBet(bet)
		current_user.money -= bet
		current_user.save
		@amount = "-$" + bet.to_s
	end

	def set_black_jack_session
		@black_jack_session = BlackJackSession.find params[:id]
	end

	def set_dealer
		@dealer = Dealer.first
	end

end
