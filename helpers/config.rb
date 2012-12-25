require "rubygems"
require "bundler/setup"

require "watir-webdriver"
require "rspec"
require "headless"
require "watir/rspec/helper"

require "./helpers/pcms_watir_wrapper"

RSpec.configure do |config|
  config.include Watir::RSpec::Helper

  # Actions before and after ALL
  config.before(:all) {
    @site_url = "http://example.com/" # TODO Change me

    @headless = Headless.new
    @headless.start
  }

  config.after(:all) {
    @headless.destroy
  }


  # Actions before and after EACH
  config.before(:each) {
    @browser = Watir::Browser.new :ff
    @browser.driver.manage.timeouts.implicit_wait = 60
    @browser.goto @site_url
    @browser.window.move_to(0, 0)
    @browser.window.resize_to(1400, 1000)
  }

  config.after(:each) {
    @browser.close
  }
end
