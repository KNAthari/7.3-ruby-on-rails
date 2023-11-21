class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)

    #charge the user's card (post request)
    charge = Stripe::Charge.create({
      amount: @donation.amount * 100, #convert to cents
      currency: 'usd',
      source: params[:stripe_token],
      description: 'Donation',
    })

    @donation.save

    flash[:success] = 'Thank you for your donation!'
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  private

  def donation_params
    params.require(:donation).permit(:firstname, :lastname, :email, :amount)
  end
end
