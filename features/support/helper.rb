module Helper
    
    # Método para tirar foto e embutir a imagem no relatório gerado pelo cucumber.
    def tirar_foto(file_name, result)
        file_path = "reports/screenshots/test_#{result}"
        photo = "#{file_path}/#{file_name}.png"
        screenshot_file = page.save_screenshot(photo)
        time_stamp = Time.now.strftime("%Y-%m-%d_%HH:%MM:%SS")
        screenshot_b64 = Base64.encode64(File.open(screenshot_file, "rb").read)
        embed(screenshot_b64, 'image/png', 'Imagem da funcionalidade automatizada: ' + time_stamp)
    end

    def add_browser_logs
        time_now = Time.now
        current_url = Capybara.current_url.to_s
        logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
        logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
        logs.any? == true
        embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain')
    end
end