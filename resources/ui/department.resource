*** Settings ***
Resource    base_ui.resource
Resource    ../../configs/ui_variables.robot


*** Keywords ***
Dado que estou na página de departamento
    Click Element    ${ID_CADASTRO}

    Wait Until Element Is Visible    ${ID_DEPARTMENT}
    Click Element    ${ID_DEPARTMENT}

    Wait Until Location Is    ${BASE_URL_UI}/department
    Location Should Be    ${BASE_URL_UI}/department

    Element Text Should Be    xpath://h1[text()='Departamento']    Departamento

Quando clicar para adicionar um novo departamento
    Wait Until Element Is Visible    //button[normalize-space()='Novo Departamento']
    Click Button    //button[normalize-space()='Novo Departamento']

    Wait Until Element Is Visible    xpath://h2[normalize-space()='Novo Departamento']
    Element Text Should Be    xpath://h2[normalize-space()='Novo Departamento']    Novo Departamento

E preencher os dados obrigatórios
    Input Text    ${ID_DEPARTMENT_NAME}    ${INPUT_DEPARTMENT}
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

