class CardsController < ApplicationController
  before_filter :authorize
  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.build(card_params) if logged_in?
    # add card to join table
    if @card.save
      shared = Shared.new(user_id: current_user.id, card_id: Card.last.id)
      shared.save
      redirect_to '/'
    else
      render new
    end
  end

  def show
    @cards = current_user.cards.all
    sum = 0
    current_user.cards.each do |x|
      sum += x.balance.to_i
    end
    @balance = sum
  end

  def edit

  end

  def update
  end

  def delete

     end
private

def card_params
  params.require(:card).permit(:number, :expyear, :expmonth, :balance, :user_id, :id)
end
end
