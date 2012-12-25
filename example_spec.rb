require "./helpers/config"
require "./helpers/pcms_accounts"
require "./helpers/pcms_registration"

describe "Example" do # TODO Set description of the test suite.
  # Include required functions from modules.
  include PCMS::WatirWrapper
  include PCMS::Accounts
  include PCMS::Registration

  it "Registration with valid data" do # TODO Set the description of the test#1.
    # TODO Write the code of test#1.
  end


  it "Registration with Dummy email address." do # TODO Set the description of the test#2.
    # TODO Write the code of test#1.
  end
end