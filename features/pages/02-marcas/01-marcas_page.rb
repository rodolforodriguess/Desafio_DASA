class Marcas < SitePrism::Page

    element :btn_open, '#open-close'
    element :abrir_delboni, 'div[data-key="mark-124"] img'

    def open_filter
        Metodos_Genericos.navegar_ate_elemento(btn_open)
        btn_open.click
    end

    def sel_regiao(valor)
        select(valor, from: 'region')
    end

    #Abaixo tinha a opção de imprimir no console sem criar um array e printar esse array, no entanto, 
    #seria impresso no escopo do passo do Quando (penúltimo passo do cenário) lá no console mas para exibir
    #no escopo do passo Então (último passo) visando ficar masi condizente, tive mandar o método retornar o array e depois fazer o puts no
    #cenário.
    
    def imprimir_labs_console
        totalLabs = all('#block-28 img').count
        labs = []
        1.upto(totalLabs) do |i|
            labs << find("#block-28 div[class$='wrap'] > div:nth-child(#{i}) img")[:alt]
        end
        return labs
    end

    def abrir_lab
        abrir_delboni.click
    end

end