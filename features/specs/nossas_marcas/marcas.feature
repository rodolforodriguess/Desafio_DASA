#language: pt

@nossas_marcas
Funcionalidade: Nossa marcas

Eu como cliente, quero acessar a homepage da DASA
Para depois acessar a opção nossas marcas
Para então pesquisar pelos laboratórios de São Paulo

Contexto: 
    Dado que eu acessei a homepage da DASA
    E clico no link Nossas Marcas

@listar_labs  
Cenário: Listar laborários de São Paulo
Quando pesquiso pelos laborários de São Paulo após abrir o filtro
Então os laboratórios são exibidos com sucesso tanto na página como no console

@listar_acessar_delboni
Cenário: Listar labs e acessar delboni
Quando pesquiso pelos laborários de São Paulo após abrir o filtro
E os listo no console
E seleciono o laboratório Debolni Auriemo
E verifico que estou na área do laboratório
E clico no link Delboni Auriemo
Então sou direcionado a página do laboratório Delboni


