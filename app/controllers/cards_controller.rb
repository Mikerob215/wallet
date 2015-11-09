class CardsController < ApplicationController
  before_filter :authorize
  def new
    @card = Card.new
  end
  def create
    @card = current_user.cards.build(card_params) if logged_in?
    # add card to join toggleable
    shared = Shared.new(user_id: current_user.id, card_id: Card.last.id)
    if @card.save && shared.save
      redirect_to '/'
    else
      render new
    end
  end
  def show
    @cards = current_user.cards.all


    @balance = @cards.inject do |sum, x|
      sum + x.balance
    end
  end
private

def card_params
  params.require(:card).permit(:number, :expyear, :expmonth, :balance, :user_id, :id)
end
end
