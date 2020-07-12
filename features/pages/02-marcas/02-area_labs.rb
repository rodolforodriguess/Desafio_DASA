class Area_Labs < SitePrism::Page

    element :abrir_link, 'div[class="owl-item active"] a'
    element :cidade, 'div[class="owl-item active"] h4 span'
    element :lab, 'div[class="owl-item active"] h2'


    def verificar_lab
        data = []
        data << cidade.text << lab.text
        return data
    end

    def abrir_site
        abrir_link.click
    end


end