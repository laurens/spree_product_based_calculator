require 'spec_helper'

describe Spree::Calculator::ProductBased do
  # # product without custom shipping_rate  
  # let!(:product1) do
  #   FactoryGirl.create :product
  # end
  # 
  # # product with custom shipping_rate of 15
  # let!(:product2) do
  #   product = FactoryGirl.create :product
  #   product.shipping_rate = 15
  #   product
  # end
  
  # product without custom shipping_rate  
  let(:variant1) { mock_model(Spree::Variant) }
  # product with custom shipping_rate of 15
  let(:variant2) { mock_model(Spree::Variant, :shipping_rate => 15) }

  let!(:line_items) { [double("LineItem", :quantity => 5, :variant => variant1), double("LineItem", :quantity => 3, :variant => variant2)] }
  let!(:object) { double("Order", :line_items => line_items) }
  
  let!(:calculator) { Spree::Calculator::ProductBased.new({:preferred_default_value => 10}) }
  
  it "correctly calculates shipping costs" do
    calculator.compute(object).should == 95 # 5 x 10 (the default rate) + 3 x 15 (product_based rate) = 95
  end
end
