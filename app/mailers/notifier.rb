class Notifier < ActionMailer::Base
  
default from: "from@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received
p 44444444444444
    @greeting = "Hi"

    mail to: "karthikv@railsfactory.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
   
  
def order_received(product)
   @product = product
   name =@product.name
   
   ActionMailer::Base.mail(:from => "v.carthik@gmial.com", :to => "karthikv@railsfactory.org", :subject => "Adding new product", :body => "the product #{name} is added into the list").deliver
 end
end
