*** Settings ***
Resource    login.resource
Resource    base_api.resource
Resource    generate_random_data.resource
*** Keywords ***
Gerar Usuario
    ${FIRST_NAME}    Gerar primeiro nome nao composto
    ${LAST_NAME}    Gera sobrenome
    ${RAMDON_PASSWORD}    Gerar Senha Aleatoria
    ${RANDOM_CPF}    Gerar CPF Unico
    ${EMAIL}    Email

    Set Test Variable    ${FULLNAME}    ${FIRST_NAME} ${LAST_NAME}
    Set Test Variable    ${MAIL}    ${EMAIL}
    Set Test Variable    ${PASSWORD}    ${RAMDON_PASSWORD}
    Set Test Variable    ${USER_CPF}    ${RANDOM_CPF}
    Set Test Variable    ${ACCESS_PROFILE}    ${PROFILE_ADMIN}

Listar Usuários
    ${token}    Realizar Login com sucesso
    ${bodyResponse}    GET On Session    alias=${SESSION_ALIAS}    url=/user/?token=${token}    verify=${True}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_OK}    ${bodyResponse}

Cadastrar Usuario com Sucesso
    ${token}    Realizar Login com sucesso
    Gerar Usuario
    ${body}    Create Dictionary
    ...    fullName=${FULLNAME}
    ...    mail=${MAIL}
    ...    accessProfile=${ACCESS_PROFILE}
    ...    cpf=${USER_CPF}
    ...    password=${PASSWORD}
    ...    confirmPassword=${PASSWORD}
    
    ${bodyResponse}    POST On Session    alias=${SESSION_ALIAS}    url=/user/?token=${token}    json=${body}    verify=${True}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_CREATED}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['msg']}    Olá ${FULLNAME}, Registro realizado com sucesso.
    Set Suite Variable    ${USER_ID}    ${bodyResponse.json()['user']['_id']}

Contar Usuario
    ${token}    Realizar Login com sucesso
    ${bodyResponse}    GET On Session    alias=${SESSION_ALIAS}    url=/user/count/?token=${token}    verify=${True}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_OK}    ${bodyResponse}

Listar Usuario Por Id
    ${token}    Realizar Login com sucesso
    ${bodyResponse}    GET On Session    alias=${SESSION_ALIAS}    url=/user/${USER_ID}?token=${token}    verify=${True}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_OK}
    Should Be Equal    ${bodyResponse.json()['_id']}    ${USER_ID}

Editar Usuario com Sucesso
    ${token}    Realizar Login com sucesso
    ${fistName}    Gerar primeiro nome nao composto
    ${lastName}    Gera sobrenome
    Set Test Variable    ${new_fullName}    ${fistName} ${lastName}

    ${new_email}    Email
    ${body}    Create Dictionary    fullName=${new_fullName}    mail=${new_email}
    ${bodyResponse}    PUT On Session    alias=${SESSION_ALIAS}    url=/user/${USER_ID}?token=${token}    json=${body}    verify=${True}
    Log    ${bodyResponse.json()}
    Status Should Be    ${STATUS_CODE_OK}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['msg']}    ${MSG_EDIT_SUCCESSFULLY}
    Should Be Equal    ${bodyResponse.json()['updatedUser']['fullName']}    ${new_fullName}
    Should Be Equal    ${bodyResponse.json()['updatedUser']['mail']}    ${new_email}

Atualizar Senha com Secesso
    ${token}    Realizar Login com sucesso
    ${password}    Gerar Senha Aleatoria
    ${body}    Create Dictionary    password=${password}    confimPassword=${password}
    ${bodyResponse}    PUT On Session    
    ...    alias=${SESSION_ALIAS}    
    ...    url=/user/password/${USER_ID}?token=${token}    
    ...    json=${body}
    ...    verify=${True}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_OK}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['msg']}    ${MSG_PASSWORD_UPDATED_SUCCESSFULLY}

Atualizar Status Para "${status}"
    ${token}    Realizar Login com sucesso
    ${body}    Create Dictionary    status=${status}
    ${bodyResponse}    PUT On Session    
    ...    alias=${SESSION_ALIAS}    
    ...    url=/user/status/${USER_ID}?token=${token}    
    ...    json=${body}    
    ...    verify=${True}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_OK}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['msg']}    Status do usuario atualizado com sucesso para status ${status}.

Deletar usuário com sucesso
    ${token}    Realizar Login com sucesso
    ${bodyResponse}    DELETE On Session    alias=${SESSION_ALIAS}    url=/user/${USER_ID}?token=${token}    verify=${True}
    Log    ${bodyResponse}
    Status Should Be    ${STATUS_CODE_OK}    ${bodyResponse}
    Should Be Equal    ${bodyResponse.json()['msg']}    ${MSG_DELETE_SUCCESSFULLY}