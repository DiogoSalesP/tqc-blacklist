*** Settings ***
Resource    base_ui.resource
Resource    ../../configs/ui_variables.robot
Resource    common.resource

*** Keywords ***
Dado que estou na página de clientes
    Click Element    ${ID_CADASTRO}

    Wait Until Element Is Visible    ${ID_CLIENTES}
    Click Element    ${ID_CLIENTES}

    Wait Until Location Is    ${BASE_URL_UI}/client
    Location Should Be    ${BASE_URL_UI}/client

    Element Text Should Be    xpath://h1[text()='Clientes']    Clientes

Quando clicar para adicionar um novo cliente
    Wait Until Element Is Visible    //button[normalize-space()='Novo Cliente']
    Click Button    //button[normalize-space()='Novo Cliente']

    Wait Until Element Is Visible    xpath://h5[text()='Novo Cadastro']
    Element Should Be Visible    xpath://h5[text()='Novo Cadastro']

E preencher os dados obrigatórios
    Preencher Formulario Cliente

E salvar o cadastro
    Wait Until Element Is Visible    //button[normalize-space()='Salvar']
    Click Button    //button[normalize-space()='Salvar']

Então o cliente deve ser cadastrado com sucesso
    Wait Until Element Is Visible    xpath://h5[text()='${dados_cliente['nome']}']
    Element Should Be Visible    xpath://h5[text()='${dados_cliente['nome']}']