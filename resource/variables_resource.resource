*** Variables ***
${INTERADOR}
${URL}                          https://www.amazon.com.br/
${MENU_ELETRONICOS}             //a[contains(.,'Eletrônicos')]
${TITULO_H1}                    //h1[contains(.,'Eletrônicos e Tecnologia')]
${EDIT_PESQUISA}                twotabsearchtextbox
${SUBMIT}                       //input[contains(@type,'submit')]
${HEADER_SEARCH}                //span[@class="rush-component"]//span[contains(.,'RESULTADOS')]
${GRID_PRODUTO}                 //div[@data-cel-widget="search_result_1"]//a[contains(.,'Xbox Series S')]
${j}                            1
${x}                            ${EMPTY}
${y}                            ${EMPTY}