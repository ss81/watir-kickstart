module PCMS
  module WatirWrapper
    def save_screenshot(method_name)
      screenshot_file = File.expand_path("..", File.dirname(__FILE__)) + "/screenshots/" + method_name + "--" + Time.now.strftime("%Y%m%d_%H%M%S") + ".png"
      @browser.driver.save_screenshot(screenshot_file)
      return screenshot_file
    end

    def drupal_get_messages(type = "all")
      @browser.div(:class, "messages").text
    end
  end
end