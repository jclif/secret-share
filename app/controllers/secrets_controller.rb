class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    @recipient_id = params[:user_id]
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.author_id = current_user.id

    if @secret.save
      redirect_to user_url(@secret.recipient_id)
    else
      render :new
    end
  end
end
