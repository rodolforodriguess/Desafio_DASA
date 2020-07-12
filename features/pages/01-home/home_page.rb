class Home < SitePrism::Page
    set_url ''

    element :nossas_marcas, '#myNavbar a[href="/marcas"]'

    def abrir_marcas
        nossas_marcas.click
    end


end