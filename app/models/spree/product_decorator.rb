Spree::Product.class_eval do
  attr_accessible :shipping_rate
  
  delegate_belongs_to :master, :shipping_rate
end