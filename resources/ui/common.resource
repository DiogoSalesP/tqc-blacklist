*** Settings ***
Resource    base_ui.resource
Resource    ../../configs/ui_variables.robot
Resource    generate_random_data.resource


*** Keywords ***
Abrir Navegador
    ${headless}=    Get Environment Variable    CI    default=False
    Run Keyword If    '${headless}' == 'true'    Abrir Navegador Headless
    ...  ELSE    Abrir Navegador Interface

Abrir Navegador Interface
    Open Browser    ${BASE_URL_UI}    Chrome
    Maximize Browser Window

Abrir Navegador Headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChormeOptions()    sys, selenium.wedriver
    Call Method    ${options}    add_argument    headless
    Call Method    ${options}    add_argument    no-sanbox
    Call Method    ${options}    add_argument    disable-dev-shm-usage
    Open Browser    ${BASE_URL_UI}    chrome    options=${options}

Fechar Navegador
    Close Browser

Preencher Formulario Cliente
    ${dados_cliente}=    Gerar Cliente

    Set Suite Variable    ${dados_cliente}

    Preencher Campo Nome Completo    ${dados_cliente['nome']}
    Preencher Campo Data Nascimento    ${dados_cliente['dataNascimento']}
    Preencher Campo Email Cliente    ${dados_cliente['email']}
    Preencher Campo Telefone    ${dados_cliente['celular']}
    Preencher Campo Cargo    ${dados_cliente['cargo']}
    Preencher Campo RG    ${dados_cliente['rg']}
    Preencher Campo CPF    ${dados_cliente['cpf']}
    Preencher Campo CEP    ${dados_cliente['cep']}
    Preencher Campo Pais    ${dados_cliente['pais']}
    Preencher Campo Cidade    ${dados_cliente['cidade']}
    Preencher Campo Estado    ${dados_cliente['estado']}
    Preencher Campo Bairro    ${dados_cliente['bairro']}
    Preencher Campo Rua    ${dados_cliente['endereco']}
    Preencher Campo Numero    ${dados_cliente['numero']}
    Preencher Campo Complemento    ${dados_cliente['complemento']}
    

Preencher Campo Nome Completo
    [Arguments]    ${nome}
    Wait Until Element Is Visible    id:fullName    timeout=10s
    Input Text    id:fullName    ${nome}

Preencher Campo Data Nascimento
    [Arguments]    ${data}
    Wait Until Element Is Visible    id:birthDate    timeout=10s
    Input Text    id:birthDate    ${data}

Preencher Campo Email Cliente
    [Arguments]    ${email}
    Wait Until Element Is Visible    id:mail    timeout=10s
    Input Text    id:mail    ${email}

Preencher Campo Telefone
    [Arguments]    ${telefone}
    Wait Until Element Is Visible    id:phone    timeout=10s
    Input Text    id:phone    ${telefone}

Preencher Campo Cargo
    [Arguments]    ${cargo}
    Wait Until Element Is Visible    id:currentRole    timeout=10s
    Input Text    id:currentRole    ${cargo}

Preencher Campo RG
    [Arguments]    ${rg}
    Wait Until Element Is Visible    id:rg    timeout=10s
    Input Text    id:rg    ${rg}

Preencher Campo CPF
    [Arguments]    ${cpf}
    Wait Until Element Is Visible    id:cpf    timeout=10s
    Input Text    id:cpf    ${cpf}

Preencher Campo CEP
    [Arguments]    ${cep}
    Wait Until Element Is Visible    id:zipCode    timeout=10s
    Input Text    id:zipCode    ${cep}

Preencher Campo Pais
    [Arguments]    ${pais}
    Wait Until Element Is Visible    id:country    timeout=10s
    Input Text    id:country    ${pais}

Preencher Campo Cidade
    [Arguments]    ${cidade}
    Wait Until Element Is Visible    id:city    timeout=10s
    Input Text    id:city    ${cidade}

Preencher Campo Estado
    [Arguments]    ${estado}
    Wait Until Element Is Visible    id:state    timeout=10s
    Input Text    id:state    ${estado}

Preencher Campo Bairro
    [Arguments]    ${bairro}
    Wait Until Element Is Visible    id:district    timeout=10s
    Input Text    id:district    ${bairro}

Preencher Campo Rua
    [Arguments]    ${rua}
    Wait Until Element Is Visible    id:street    timeout=10s
    Input Text    id:street    ${rua}

Preencher Campo Numero
    [Arguments]    ${numero}
    Wait Until Element Is Visible    id:number    timeout=10s
    Input Text    id:number    ${numero}

Preencher Campo Complemento
    [Arguments]    ${complemento}
    Wait Until Element Is Visible    id:complement    timeout=10s
    Input Text    id:complement    ${complemento}