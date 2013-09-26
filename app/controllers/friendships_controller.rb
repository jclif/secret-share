class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(params[:friendship])

    if @friendship.save
      redirect_to user_url(@friendship.victim_id)
    else
      redirect_to users_url
    end
  end

end
