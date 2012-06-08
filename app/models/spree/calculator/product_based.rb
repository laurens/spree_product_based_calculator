module Spree
  class Calculator::ProductBased < Calculator
    preference :property_name, :string, :default => 'shipping_rate'
    preference :default_value, :decimal, :default => 0
  
    attr_accessible :preferred_property_name, :preferred_default_value
  
    def self.description
      I18n.t(:product_based)
    end
  
    def compute(object=nil)
      return 0 if object.nil?
      object.line_items.reduce(0) do |sum, line_item|
        key = preferred_property_name.to_s
        unless line_item.product.property(key).blank?
          amount = line_item.product.property(key).to_f
        else
          amount = preferred_default_value
        end
        # variant using a field in product model:
        # if line_item.product.respond_to?(key)
        #   amount = line_item.product.send(key)
        # else
        #   amount = preferred_default_value
        # end
        sum + amount * line_item.quantity
      end
    end
  end 
end