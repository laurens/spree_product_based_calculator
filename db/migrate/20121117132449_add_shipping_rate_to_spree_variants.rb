class AddShippingRateToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :shipping_rate, :decimal
  end
end
