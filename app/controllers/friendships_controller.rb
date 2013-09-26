class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(params[:friendship])
    @friendship.stalker_id = current_user.id

    if @friendship.save!
      render json: @friendship
    else
      head 404
    end
  end

  def destroy
    @friendship = Friendship.find_by_id(params[:id])

    if @friendship
      @friendship.delete
      head :ok
    else
      head 404
    end
  end

end
