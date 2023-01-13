*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource   variables_resource.robot 

*** Keywords ***
Capture screenshot do elemento com o valor do locator "${LOCATOR}"
    Capture Element Screenshot    locator=${LOCATOR}
Abrir o navegador                               
     Open Browser        browser=chrome       
     Maximize Browser Window
     
Fechar o navegador  
    Capture Page Screenshot                            
    Close Browser    
Acessar a home page do site "${URL}"  
    Go To      url=${URl}  
    Wait Until Element Is Visible       locator=${MENU_ELETRONICOS} 

Entrar no menu "${SUB_MENU}"
    Click Element                       locator=//a[contains(.,'${SUB_MENU}')]

Verificar se aparece a frase "${TITULO_ELETRONICO}"
    Wait Until Page Contains            text=${TITULO_ELETRONICO}
    Wait Until Element Is Visible       locator=${TITULO_H1}

Verificar se o título da página fica "${TITULO_ABA}"
    Title Should Be      ${TITULO_ABA} 

Verificar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${CATEGORIA}']

Preencher o campo "${CAMPO}" com o valor "${VALOR}"
    IF    '${campo}' == 'pesquisa'
        input text   locator=${edit_pesquisa}     text=${valor}
    ELSE
         Fatal Error    message=elemento não encontrado
    END
        
Clicar no botão de pesquisa
    Click Element                    locator=${SUBMIT}  

Verificar de "${INIT}" até o "${END}" resultados da pesquisa se está sendo listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//div[@data-cel-widget="search_result_1"]         timeout=20s        error=Elemento não encontrado dentro de 
    
    FOR    ${i}    IN RANGE    ${INIT}    ${END}    1
        Element Should Be Visible    locator=//div[@data-cel-widget="search_result_${i}"]//*[contains(.,'${PRODUTO}')] 
        Capture screenshot do elemento com o valor do locator "//div[@data-cel-widget="search_result_${i}"]//*[contains(.,'${PRODUTO}')]"
        IF    ${j} == 2
            Exit For Loop
        ELSE
            ${j}      Evaluate    ${j}+1
        END
    END

