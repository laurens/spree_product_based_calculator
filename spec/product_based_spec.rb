require 'spec_helper'

describe Spree::Calculator::ProductBased do
  # product without custom shipping_rate  
  let!(:product1) do
    FactoryGirl.create :product
  end

  # product with custom shipping_rate of 15
  let!(:product2) do
    product = FactoryGirl.create :product
    product.set_property('shipping_rate', '15')
    product
  end

  let!(:line_items) { [double("LineItem", :quantity => 5, :product => product1), double("LineItem", :quantity => 3, :product => product2)] }
  let!(:object) { double("Order", :line_items => line_items) }
  
  let!(:calculator) { Spree::Calculator::ProductBased.new({:preferred_property_name => 'shipping_rate', :preferred_default_value => 10}) }
  
  it "correctly calculates shipping costs" do
    calculator.compute(object).should == 95 # 5 x 10 (the default rate) + 3 x 15 (product_based rate) = 95
  end
end
