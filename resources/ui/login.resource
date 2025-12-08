*** Settings ***
Resource    base_ui.resource
Resource    ../../configs/ui_variables.robot
Resource    ../../configs/api_variables.robot

*** Keywords ***
Dado que estou na página de login
    Wait Until Location Is    ${BASE_URL_UI}/login
    Location Should Be    ${BASE_URL_UI}/login

Quando eu inserir um usuário válido e senha válida
    Wait Until Element Is Visible    ${ID_EMAIL}
    Input Text    ${ID_EMAIL}    ${USER_MAIL}

    Wait Until Element Is Visible    ${ID_PASSWORD}
    Input Password    ${ID_PASSWORD}    ${USER_PASSWORD}

E clicar no botão de login
    Wait Until Element Is Visible    ${ID_LOGIN}
    Click Button    ${ID_LOGIN}

Então devo ser redirecionado para a página Home
    Wait Until Location Is    ${BASE_URL_UI}/home
    Location Should Be    ${BASE_URL_UI}/home
