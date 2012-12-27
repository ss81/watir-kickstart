module PCMS
  module WatirWrapper
    def save_screenshot()
      screenshot_file = @path_to_report + @test_name + "--" + Time.now.strftime("%Y%m%d_%H%M%S") + ".png"
      @screenshots.push screenshot_file
      @browser.driver.save_screenshot(screenshot_file)
      return screenshot_file
    end

    def drupal_get_messages(type = "all")
      @browser.div(:class, "messages").text
    end
  end
end
