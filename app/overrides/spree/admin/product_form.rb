Deface::Override.new(
                      :name => "add shipping_rate field to product form",
                      :virtual_path => "spree/admin/products/_form",
                      :insert_before => "code[erb-loud]:contains('f.field_container :available_on')",
                      :partial => "spree/admin/products/shipping_rate_field"
                    )
