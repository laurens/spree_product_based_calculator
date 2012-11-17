module Spree
  class Calculator::ProductBased < Calculator
    preference :default_value, :decimal, :default => 0
  
    attr_accessible :preferred_default_value
  
    def self.description
      I18n.t(:product_based)
    end
  
    def compute(object=nil)
      return 0 if object.nil?
      object.line_items.reduce(0) do |sum, line_item|
        unless line_item.variant.shipping_rate.blank?
          amount = line_item.variant.shipping_rate
        else
          amount = preferred_default_value
        end

        sum + amount * line_item.quantity
      end
    end
  end 
end