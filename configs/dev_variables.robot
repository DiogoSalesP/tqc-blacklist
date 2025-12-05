*** Variables ***
${SESSION_ALIAS}    develop
${BASE_URL}    https://api-blacklist.qacoders.dev.br/api
${USER_MAIL}    blacklist_robot@qa.com
${USER_PASSWORD}    p4Hg83@%sqRw
${APPLICATION}    application/json
${PROFILE_ADMIN}    ADMIN

${STATUS_CODE_OK}    200
${STATUS_CODE_CREATED}    201
${STATUS_CODE_BAD_REQUEST}    400
${STATUS_CODE_NOT_FOUND}    404
${STATUS_CODE_INTERNAL_SERVER_ERROR}    500

${ALERT_400}    E-mail ou senha informados são inválidos.
${ALERT_USER_NOT_FOUND}    Esse usuário não existe em nossa base de dados.

${MSG_EDIT_SUCCESSFULLY}    Dados atualizados com sucesso!
${MSG_PASSWORD_UPDATED_SUCCESSFULLY}    Senha atualizada com sucesso!
${MSG_DELETE_SUCCESSFULLY}    Usuário deletado com sucesso.

${ERROR_FAILED_TOKEN}    Failed to authenticate token.
${ERROR_NO_TOKEN}    No token provided.