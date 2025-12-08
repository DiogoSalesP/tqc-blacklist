*** Settings ***
Resource    ../../../resources/ui/login.resource
Resource    ../../../resources/ui/client.resource
Resource    ../../../resources/ui/common.resource

Task Setup    Abrir Navegador
Task Teardown    Fechar Navegador


*** Test Cases ***
Cenario 01: Cadastrar Novo Cliente com Sucesso
    [Documentation]    Realizar login, navega até Clientes e cadastra um novo cliente com sucesso
    Dado que estou na página de login
    Quando eu inserir um usuário válido e senha válida
    E clicar no botão de login
    Então devo ser redirecionado para a página Home


    Dado que estou na página de clientes
    Quando clicar para adicionar um novo cliente
    E preencher os dados obrigatórios
    E salvar o cadastro
    Então o cliente deve ser cadastrado com sucesso