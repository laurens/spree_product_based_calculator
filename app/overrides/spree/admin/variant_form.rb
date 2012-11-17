Deface::Override.new(
                      :name => "add shipping_rate field to variant form",
                      :virtual_path => "spree/admin/variants/_form",
                      :insert_after => "code[erb-loud]:contains('text_field :cost_price')",
                      :partial => "spree/admin/variants/shipping_rate_field"
                    )
