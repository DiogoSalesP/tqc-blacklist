*** Settings ***
Documentation    Keywords para geração de dados de teste
Resource    base_api.resource

*** Keywords ***
Gerar CPF Unico
    [Documentation]    Gera um CPF único usando timestamp
    ${timestamp}    Get Current Date    result_format=%H%M%S%f
    ${cpf}    Evaluate    '${timestamp}'[:11].zfill(11)
    RETURN    ${cpf}

Gerar Senha Aleatoria
    [Documentation]    Gera uma senha aleatória válida
    ${randomString}    Generate Random String    3    [NUMBERS]
    ${senha}    Set Variable    Test@${randomString}
    RETURN    ${senha}

Gerar primeiro nome nao composto
    [Documentation]    Gera primeiro nome nao composto
    ${nome_completo}    First Name
    ${nome_simples}    Split String    ${nome_completo}    ${SPACE}
    ${primeiro_nome}    Set Variable    ${nome_simples[0]}
    ${primeiro_nome}    Convert To Title Case    ${primeiro_nome}
    RETURN    ${primeiro_nome}

Gera sobrenome
    [Documentation]    Gera sobrenome
    ${sobrenome}    Last Name
    ${sobrenome}    Convert To Title Case    ${sobrenome}
    RETURN    ${sobrenome}
