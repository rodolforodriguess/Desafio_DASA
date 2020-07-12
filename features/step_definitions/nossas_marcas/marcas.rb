#1º cenário
Dado("que eu acessei a homepage da DASA") do
    expect(page.title).to eql 'Home'
end

Quando("clico no link Nossas Marcas") do
    @page.call(Home).abrir_marcas
end

Quando("pesquiso pelos laborários de São Paulo após abrir o filtro") do
    @page.call(Marcas).open_filter
    @page.call(Marcas).sel_regiao('São Paulo')
end

Então("os laboratórios são exibidos com sucesso tanto na página como no console") do
    puts @page.call(Marcas).imprimir_labs_console
end

#2º cenário
Quando("os listo no console") do
    @page.call(Marcas).open_filter
    @page.call(Marcas).sel_regiao('São Paulo')
    puts @page.call(Marcas).imprimir_labs_console
end

Quando("seleciono o laboratório Debolni Auriemo") do
    @page.call(Marcas).abrir_lab
end

Quando("verifico que estou na área do laboratório") do
    expect(@page.call(Area_Labs).verificar_lab[0]).to eql 'SÃO PAULO'
    expect(@page.call(Area_Labs).verificar_lab[1]).to eql 'Delboni Auriemo'
end

Quando("clico no link Delboni Auriemo") do
    @page.call(Area_Labs).abrir_site
end

Então("sou direcionado a página do laboratório Delboni") do
    Metodos_Genericos.trocar_aba('Delboni Auriemo | Laboratório de Exames e de Imagem')
    expect(page).to have_text 'Resultados de Exames'
    expect(current_url).to eq 'https://delboniauriemo.com.br/'    
end
