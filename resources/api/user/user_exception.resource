*** Settings ***
Resource    ../login.resource
Resource    ../base_api.resource
Resource    ../generate_random_data.resource
Resource    user.resource


*** Keywords ***
Listar Usuário por Id Inválido
    ${token}    Realizar Login com sucesso
    Cadastrar Usuario com Sucesso
    ${bodyResponse}    GET On Session    
    ...    alias=${SESSION_ALIAS}    
    ...    url=/user/${USER_ID}@?token=${token}    
    ...    verify=${True}
    ...    expected_status=${STATUS_CODE_INTERNAL_SERVER_ERROR}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_INTERNAL_SERVER_ERROR}
    Should Be Equal    
    ...    ${bodyResponse.json()['error']}    
    ...    CastError: Cast to ObjectId failed for value \"${USER_ID}@\" (type string) at path \"_id\" for model \"User\"

Listar Usuario Informando Id Não cadastrado
    ${token}    Realizar Login com sucesso
    Cadastrar Usuario com Sucesso
    Deletar usuário com sucesso
    ${bodyResponse}    GET On Session
    ...    alias=${SESSION_ALIAS}    
    ...    url=/user/${USER_ID}?token=${token}    
    ...    verify=${True}
    ...    expected_status=${STATUS_CODE_NOT_FOUND}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_NOT_FOUND}
    Should Be Equal    ${bodyResponse.json()['alert'][0]}    ${ALERT_USER_NOT_FOUND}

Listar Usuario Informando Token Invalido
    ${token}    Realizar Login com sucesso
    ${bodyResponse}    GET On Session
    ...    alias=${SESSION_ALIAS}    
    ...    url=/user/${USER_ID}?token=${token}@
    ...    verify=${True}
    ...    expected_status=${STATUS_CODE_BAD_REQUEST}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_BAD_REQUEST}
    Should Be Equal    ${bodyResponse.json()['errors'][0]}    ${ERROR_FAILED_TOKEN}

Listar Usuario Informando Token Vazio
    ${bodyResponse}    GET On Session
    ...    alias=${SESSION_ALIAS}    
    ...    url=/user/${USER_ID}?token=
    ...    verify=${True}
    ...    expected_status=${STATUS_CODE_BAD_REQUEST}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_BAD_REQUEST}
    Should Be Equal    ${bodyResponse.json()['errors'][0]}    ${ERROR_NO_TOKEN}