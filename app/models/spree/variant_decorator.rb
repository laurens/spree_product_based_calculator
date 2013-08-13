Spree::Variant.class_eval do
  attr_accessible :shipping_rate

  def shipping_rate=(shipping_rate)
    self[:shipping_rate] = parse_price(shipping_rate) if shipping_rate.present?
  end
end