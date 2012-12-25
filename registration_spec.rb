require "./helpers/config"
require "./helpers/user"

describe "Registration" do
  include PCMS::WatirWrapper
  include PCMS::Users::Accounts
  include PCMS::Users::Registration

  it "Registration with valid data" do
    goto_reg_page()

    user = get_random_user()
    fill_reg_form(user)

    save_screenshot("register-with-billing")
    submit_reg_form()
    save_screenshot("register-with-billing")

    drupal_get_messages().should == "Your password and further instructions have been sent to your e-mail address."
  end


  it "Registration with Dummy email address." do
    goto_reg_page()

    user = get_random_user()
    user[:email] = "dummy"
    fill_reg_form(user)

    save_screenshot("register-with-dummy-email")
    submit_reg_form()
    save_screenshot("register-with-dummy-email")

    get_page_message().should == "The e-mail address dummy is not valid."
  end

end
