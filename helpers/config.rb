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
  config.before :all do
    @site_url = "http://example.com/" # TODO Change me

    @headless = Headless.new
    @headless.start
  end

  config.after :all do
    @headless.destroy
  end


  #################################
  # Actions before and after EACH
  #################################
  config.before :each do
    @browser = Watir::Browser.new :ff
    @browser.driver.manage.timeouts.implicit_wait = 60
    @browser.window.move_to(0, 0)
    @browser.window.resize_to(1400, 1000)

    @browser.goto "http://google.com"
    @headless.video.start_capture

    @browser.goto @site_url

    @screenshots = []
    @path_to_report = File.expand_path("..", File.dirname(__FILE__)) + "/reports/" + example.metadata[:example_group][:description_args][0].to_s.downcase + "/"
    @test_name = example.metadata[:description].gsub(/[.,=]/, " ").strip.gsub(/\s+/, "-").downcase

    if not File.directory? @path_to_report
      FileUtils.mkdir @path_to_report
    end
  end

  config.after :each do
    # Remove screenshots after successful test.
    if example.exception == nil
      @screenshots.each do |screenshot|
        if File.exist?(screenshot)
          File.delete(screenshot)
        end
      end
    else 
      @headless.video.stop_and_save @path_to_report + @test_name + "--" + Time.now.strftime("%Y%m%d_%H%M%S") + ".mov"
    end

    # Close browser.
    @browser.close
  end
end
