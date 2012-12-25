watir-kickstart
===============

Watir Kickstart

## Example of Registration module

    module Registration
      def goto_reg_page
        link(:text, "Create new account").click
      end

      def fill_reg_form(user, with_shipping = false)
        text_field(:name, "name").set(user[:username])
        text_field(:name, "mail").set(user[:email])

        text_field(:name, "egility_field_fname[0][value]").set(user[:first_name])
        text_field(:name, "egility_field_lname[0][value]").set(user[:last_name])
        text_field(:name, "egility_field_contact_phone[0][value]").set(user[:phone])

        text_field(:name, "location_name_ba").set(user[:billing_name])
        text_field(:name, "location_address1_ba").set(user[:billing_street1])
        text_field(:name, "location_address2_ba").set(user[:billing_street2])
        text_field(:name, "location_city_ba").set(user[:billing_city])
        select_list(:name, "location_country_ba").select(user[:billing_country])
        sleep 5
        select_list(:name, "location_state_ba").select(user[:billing_state])
        text_field(:name, "location_postal_ba").set(user[:billing_zip])
        text_field(:name, "location_phone_ba").set(user[:billing_phone])

        if with_shipping
          # Fill shipping address
        end
      end

      def submit_reg_form
        button(:name, "op").click
      end
    end
