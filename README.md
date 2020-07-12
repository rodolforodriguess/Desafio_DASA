Desafio para a empresa DASA

Para executar o projeto, seguir os passos abaixo:

1º Baixar a instalar o Ruby. Recomendo a versão 2.6.3-1 com DevKit que é a que usei. Abaixo link: https://rubyinstaller.org/downloads/archives/

2º Baixar e instalar um editor de texto e código. Eu recomendo o Visual Studio Code além de um Runner, no caso pode se rodar pelo terminal do próprio Visual Studio Code ou Console do Windows mas recomendo o CMDER.

Abaixo os links: 

https://code.visualstudio.com/download
https://cmder.net

3º Clonar o projeto

4º Navegar até a pasta do projeto pele console e executar o comando bundle install para instalar as libs/gems em sua máquina.

5º Agora é só rodar um cucumber --t e a tag do cenário como:

cucumber --t @nossas_marcas

Observações:

O Arquivo cucumber.yml contém opções de perfis o qual você simplementes comenta todos e deixa um não comentado para execução dos cenários com a possibilidade de rodar no chrome, firefox, firefox_headless e chrome headless e em um ambiente específico o que é muito útil em uma esteira CI/CD, neste caso teria que ser criado um arquivo .yml para aquele ambiente específico dentro do caminho support/ambientes. Eu coloquei só o de QA.

Na pasta reports, é possível ver o relatório do cucumber e o da lib Report Builder que é mais "encorpado".

Para abrir o browser, decidi usar um lambda lá no hooks que recebe a instância das classes de forma genérica. Assim, no cenário, a variável @page é chamada passando como argumento o nome da classe e logo em seguida o método respectivo com ou sem seu argumento. 

Uma outra maneira é criar um módulo em um arquivo page_helper e então um método para cada classe. Esse método levaria o mesmo nome de uma variável dentro dele que receberia a instancia da classe e depois, o módulo seria injetado no env como global e por fim, chamado no cenário. As duas abordagens parecem ser interessantes no que diz respeito a boas práticas, no entanto, decidi escolher a primeira porque a longo prazo, tive a impressão que com a criação de várias classes/pages, vários métodos seriam criados no page_helper o que deixaria o arquivo enorme. A desvantagem do lambda se é que é uma, é que a linha do código ficam um pouco mais comprida lá no cenário mas nada assustador.


