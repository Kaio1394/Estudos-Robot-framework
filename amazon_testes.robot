*** Settings ***
Documentation     Essa suíte testa o site da Amazon.com.br
Resource          resource/amazon_resource.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verifica a categoria Computadores e Informática

    [Tags]             menus categorias
    Acessar a home page do site "https://www.amazon.com.br/"
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

 Caso de Teste 02 - Pesquisar um produto  
    [Tags]             pesquisa_produto
    Acessar a home page do site "https://www.amazon.com.br/"
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Preencher o campo "pesquisa" com o valor "Xbox Series S"
    Clicar no botão de pesquisa
    # Verificar os "10" resultados da pesquisa se está listando o produto pesquisado
    Verificar de "1" até o "10" resultados da pesquisa se está sendo listando o produto ""


