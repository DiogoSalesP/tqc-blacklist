*** Settings ***
Resource    base_api.resource
Resource    ../../configs/dev_variables.robot
*** Keywords ***
Criar Sessao
    ${headers}    Create Dictionary    accpet=${APPLICATION}    Content-Type=${APPLICATION}
    Create Session    alias=${SESSION_ALIAS}    url=${BASE_URL}    headers=${headers}

Realizar Login
    [Arguments]    ${mail}     ${password}    ${status_code}
    ${body}    Create Dictionary    mail=${mail}    password=${password}
    Criar Sessao
    ${bodyResponse}    POST On Session    
    ...    alias=${SESSION_ALIAS}    
    ...    url=/login    
    ...    json=${body}    
    ...    verify=${True}
    ...    expected_status=${status_code}
    Log    ${bodyResponse.json()}
    RETURN    ${bodyResponse}

Realizar Login com sucesso
    ${bodyResponse}    Realizar Login    ${USER_MAIL}    ${USER_PASSWORD}    ${STATUS_CODE_OK}
    Status Should Be    ${STATUS_CODE_OK}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['msg']}    Olá ${bodyResponse.json()['user']['fullName']}, autenticação autorizada com sucesso!

Realizar Login com Email Válido e Senha Inválida
    ${bodyResponse}    Realizar Login    ${USER_MAIL}    ${USER_PASSWORD}132    ${STATUS_CODE_BAD_REQUEST}
    Status Should Be    ${STATUS_CODE_BAD_REQUEST}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['alert']}    ${ALERT_400}

Realizar Login com Email Inválido e Senha Válida
    ${bodyResponse}    Realizar Login    ${USER_MAIL}.br    ${USER_PASSWORD}    ${STATUS_CODE_BAD_REQUEST}
    Status Should Be    ${STATUS_CODE_BAD_REQUEST}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['alert']}    ${ALERT_400}