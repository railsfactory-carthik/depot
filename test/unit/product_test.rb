require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def new_product(image_url)
  Product.new(:title => "My Book Title" , :description => "yyy" , :price => 1, :image_url => image_url)
  end
  test "image url" do
  #Report erratum
  #this copy Prepared exclusively for Jared Rosoff is (B8.0 printing, September 9, 2010)
  #ITERATION B2: UNIT TESTING OF MODELS 111
  ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
  bad = %w{ fred.gif/more fred.gif.more }
  ok.each do |name|
  assert new_product(name).valid?, "#{name} shouldn't be invalid"
  end
  bad.each do |name|
  assert new_product(name).invalid?, "#{name} shouldn't be valid"
  end
  end
  #Here we’ve
end

