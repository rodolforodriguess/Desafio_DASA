# Importa as gems
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'webdrivers' 
require 'site_prism'
require 'capybara'
require "report_builder"



require_relative 'helper.rb'

World(Helper)

# Variavel para o nome do ambiente
AMBIENTE = ENV['AMBIENTE'] 
# Variavel para o nome do browser
BROWSER = ENV['BROWSER']
# Configuracao para dizer o caminho do ambiente a se usar
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")


#Define o tempo que a gem webdrivers verifica por atualizações dos drivers dos navegadores como chrome_driver para o Chrome e gecko_driver para o firefox
#O valor abaixo representa 24 horas em segundos
Webdrivers.cache_time = 86_400

# Configura o link principal e qual navegador vai usar
Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_home'] 
end

# Configura o tipo de browser
Capybara.register_driver :selenium do |app|
  case BROWSER
    # Rodar no browser Chrome
  when 'chrome'  
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities
      .chrome(
        'chromeOptions' => {'args' => ['--start-maximized',
        '--disable-infobars'] }
      )
    )
    # Rodar no chrome headless
  when 'chrome_headless'
      options = ::Selenium::WebDriver::Chrome::Options.new(
        args: %w[headless no-sandbox disable-dev-shm-usage]
        )
    
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  # Rodar no browser firefox
  when 'firefox'
  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities
      .firefox(marionette: true)
  )
    # Rodar no browser firefox headless
  when 'firefox_headless'
    browser_options = ::Selenium::WebDriver::Firefox::Options.new()
    browser_options.args << '--headless'
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: browser_options
    )
  end
end

# Configura o tempo maximo de espera
Capybara.default_max_wait_time = 10

browser = Capybara.current_session.driver.browser
#Define se maximiza a tela ou redimensiona conforme o tipo de modo de browser utilizado
if BROWSER.eql?('chrome_headless') || BROWSER.eql?('firefox_headless')
 browser.manage.window.resize_to(1920, 1080)
else
  browser.manage.window.maximize 
end
browser.manage.delete_all_cookies