module Metodos_Genericos

    extend Capybara::DSL
    
    def self.navegar_ate_elemento(elemento)
        page.execute_script('arguments[0].scrollIntoView(true)', elemento)
    end

    def self.trocar_aba
        unless page.title.include?('Delboni Auriemo | Laboratório de Exames e de Imagem')
           sleep 1
        end
        switch_to_window windows.first
        page.driver.browser.close
        switch_to_window windows.last
    end
end