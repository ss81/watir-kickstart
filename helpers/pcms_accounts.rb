module PCMS
  module Accounts
    def get_random_user
      random = "test" + Random.new.rand(9999).to_s

      return {
          :username => random,
          :email => random + "@gmail.com",
          :first_name => "ERIK",
          :last_name => "Marzett",
          :phone => "5555-555-555",

          :billing_name => "Billing Address",
          :billing_street1 => "Level 36, Riparian Plaza",
          :billing_street2 => "71 Eagle Street",
          :billing_city => "Brisbane",
          :billing_state => "QLD",
          :billing_zip => "4000",
          :billing_country => "Australia",
          :billing_phone => "5555-555-555",

          :shipping_name => "Shipping Address",
          :shipping_street1 => "Level 11, St George Centre",
          :shipping_street2 => "60 Marcus Clarke Street",
          :shipping_city => "Canberra",
          :shipping_state => "VIC",
          :shipping_zip => "2601",
          :shipping_country => "Australia",
          :shipping_phone => "5555-555-555"
      }
    end
  end
end