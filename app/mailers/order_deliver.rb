class OrderDeliver < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_deliver.order_send.subject
  #
  def order_send(order)
    @greeting = "Hi"
p 1111111111
p order
 @orde_email = order.email

 mail(:to =>  order.email, :subject => "Your Order")
  end
end
