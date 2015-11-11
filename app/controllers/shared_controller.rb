class SharedController < ApplicationController
  def new
    @card = Card.find(params[:id])
    @shared = Shared.new

  end

  def create
    @card = Card.find(params[:id])
    @user = User.find_by_email(params[:email])
    @shared = Shared.new(card_id:@card.id, user_id:@user.id)
    if @shared.save
      redirect_to '/'
    else
      render 'share'
    end
  end

  def delete
  end

  private
  def shared_params
    params.require(:id)
  end
end
