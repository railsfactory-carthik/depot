class PaymentsController < ApplicationController

  layout 'authorize_net'
  helper :authorize_net
  protect_from_forgery :except => :relay_response

  # GET
  # Displays a payment form.
  def payment
    p 111111111111111111111
    #p Cart.find(params[:id])
   
    #p @cart=Cart.find(params[:id])
    p 111111111111111111111111
    #p @cart.total_price
    @amount = session[:total_price]
    @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['api_transaction_key'], @amount, :hosted_payment_form => true)
    @sim_transaction.set_hosted_payment_receipt(AuthorizeNet::SIM::HostedReceiptPage.new(:link_method => AuthorizeNet::SIM::HostedReceiptPage::LinkMethod::GET, :link_text => 'Continue', :link_url => payments_thank_you_url(:only_path => false)))
  end
  
  # GET
  # Displays a thank you page.
  def thank_you
    Cart.destroy(session[:cart_id])
	session[:cart_id] = nil
    @auth_code = params[:x_auth_code]
  end

end
