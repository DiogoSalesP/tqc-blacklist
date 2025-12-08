*** Settings ***
Resource    base_ui.resource
Resource    ../../configs/ui_variables.robot


*** Keywords ***
Dado que estou na página de centro de custo
    Click Element    ${ID_CADASTRO}

    Wait Until Element Is Visible    ${ID_CONST_CENTE}
    Click Element    ${ID_CONST_CENTE}

    Wait Until Location Is    ${BASE_URL_UI}/costCenter
    Location Should Be    ${BASE_URL_UI}/costCenter

    Element Text Should Be    xpath://h1[text()='Centro de Custo']    Centro de Custo

Quando clicar para adicionar um novo centro de custo
    Wait Until Element Is Visible    //button[normalize-space()='Novo Centro de Custo']
    Click Button    //button[normalize-space()='Novo Centro de Custo']

    Wait Until Element Is Visible    xpath://h2[normalize-space()='Novo Centro de Custo']
    Element Text Should Be    xpath://h2[normalize-space()='Novo Centro de Custo']    Novo Centro de Custo

E preencher os dados obrigatórios
    Input Text    ${ID_CONST_CENTERNAME}    ${INPUT_COST_CENTER}
    ${itens}=    Get List Items    xpath=//select
    ${itens_filtrados}=    Create List
    FOR    ${item}    IN    @{itens}
        Run Keyword If    '${item}' != '' and '${item}' != 'Diretoria'    
        ...    Append To List    ${itens_filtrados}    ${item}
    END
    ${primeiro}=    Get From List    ${itens_filtrados}    0
    Select From List By Label    xpath=//select    ${primeiro}

E salvar o cadastro
    Wait Until Element Is Visible    //button[normalize-space()='Salvar']
    Click Button    //button[normalize-space()='Salvar']
