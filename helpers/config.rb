require "rubygems"
require "bundler/setup"

require "watir-webdriver"
require "rspec"
require "headless"
require "watir/rspec/helper"

require "./helpers/pcms_watir_wrapper"

RSpec.configure do |config|
  config.include Watir::RSpec::Helper
  config.include PCMS::WatirWrapper

  ###############################
  # Actions before and after ALL
  ###############################
  config.before(:all) {
    @site_url = "http://example.com/" # TODO Change me

    @headless = Headless.new
    @headless.start
  }

  config.after(:all) {
    @headless.destroy
  }


  #################################
  # Actions before and after EACH
  #################################
  config.before(:each) {
    # Open a site in browser and resize the browser's window.
    @browser = Watir::Browser.new :ff
    @browser.driver.manage.timeouts.implicit_wait = 60
    @browser.goto @site_url
    @browser.window.move_to(0, 0)
    @browser.window.resize_to(1400, 1000)
    
    # Storage for test screenshots.
    example.metadata[:screenshot] = []
  }

  config.after(:each) {
    # Remove screenshots after successful test.
    if example.exception == nil
      example.metadata[:screenshot].each do |screenshot|
        if File.exist?(screenshot)
          File.delete(screenshot)
        end
      end
    end

    # Close browser.
    @browser.close
  }
end
