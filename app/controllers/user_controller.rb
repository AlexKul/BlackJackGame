class UserController < ApplicationController
  before_action :set_user

  def self.getLevel (user)
  	amount = user.experience.to_i

  	if amount > 20000
 		return 5
 	elsif amount > 12000
 		return 4
 	elsif amount > 7000
 		return 3
 	elsif amount > 2000
 		return 2
 	elsif amount > 100
 		return 1	
 	else 
 		return "Beginner"		  		
  	end
  end

  def self.addExperience (bet, user)

  	if bet > 10000 
  		user.experience += bet/10
  	elsif bet > 1000 
  		user.experience += bet/4
  	else
  		user.experience += bet/2
  	end
  	user.save!
  end

  def setUser
  	
  end
end
