SpreeProductBasedCalculator
=========================

Allows product-based configuration of shipping rates.


Description
=======

Calculates shipping rate based on a product’s *shipping_rate* property.
You can customize the property that is being used in the Spree Administration area.

You can set a default rate that will be used for products with no specified shipping rate.

Installation
=======

Add the gem to your Gemfile…

    gem 'spree_product_based_calculator'

…and run
    
    $ bundle install

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2012 Laurens Nienhaus, released under the New BSD License
