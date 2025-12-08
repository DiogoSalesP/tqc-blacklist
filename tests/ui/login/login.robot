*** Settings ***
Resource    ../../../resources/ui/login.resource
Resource    ../../../resources/ui/common.resource

Test Setup    Abrir Navegador
Test Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01: Login de usuário com sucesso
    [Documentation]    Realizar login

    Dado que estou na página de login
    Quando eu inserir um usuário válido e senha válida
    E clicar no botão de login
    Então devo ser redirecionado para a página Home