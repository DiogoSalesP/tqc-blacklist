*** Settings ***
Resource    ../../configs/ui_variables.robot
Resource    ../api/base_api.resource


*** Keywords ***
Gerar Cliente
    [Documentation]    Gera dados de cliente aleatórios através da API 4devs

    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    Create Session    alias=4devs    url=https://www.4devs.com.br    headers=${headers}    verify=${True}

    ${form_data}    Create Dictionary    
    ...    acao=gerar_pessoa
    ...    sexo=I
    ...    pontuacao=N
    ...    idade=18
    ...    cep_estado=CE
    ...    txt_qtde=1
    ...    cep_cidade=1638

    ${response}=    POST On Session    alias=4devs    url=/ferramentas_online.php    data=${form_data}    expected_status=200

    ${pessoa}=    Set Variable    ${response.json()[0]}

    ${rg_completo}=    Set Variable    ${pessoa['rg']}
    ${rg_tratado}=    Get Substring    ${rg_completo}    0    7

    ${data_nascimento}=    Set Variable    ${pessoa['data_nasc']}
    ${data_tratada}=    Remove String    ${data_nascimento}    /
    
    ${cliente_dados}=    Create Dictionary
    ...    nome=${pessoa['nome']}
    ...    dataNascimento=${data_tratada}
    ...    email=${pessoa['email']}
    ...    celular=${pessoa['celular']}
    ...    cargo=QA
    ...    rg=${rg_tratado}
    ...    cpf=${pessoa['cpf']}
    ...    cep=${pessoa['cep']}
    ...    pais=Brasil
    ...    cidade=${pessoa['cidade']}
    ...    estado=${pessoa['estado']}
    ...    bairro=${pessoa['bairro']}
    ...    endereco=${pessoa['endereco']}
    ...    numero=${pessoa['numero']}
    ...    complemento=Apartamento 01
        
    RETURN    ${cliente_dados}