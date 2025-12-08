*** Settings ***
Resource    ../../../resources/ui/common.resource
Resource    ../../../resources/ui/login.resource
Resource    ../../../resources/ui/department.resource

Task Setup    Abrir Navegador
Task Teardown    Fechar Navegador


*** Test Cases ***
Cenario 01: Cadastrar Novo Departamento
    [Documentation]    Realizar login, navega até Departamento, cadastra um novo Departamento e verificar se foi cadastrado com sucesso
    # Realizar login
    Dado que estou na página de login
    Quando eu inserir um usuário válido e senha válida
    E clicar no botão de login
    Então devo ser redirecionado para a página Home

    Dado que estou na página de departamento
    Quando clicar para adicionar um novo departamento
    E preencher os dados obrigatórios
    E salvar o cadastro
    # Então o departamento deve ser cadastrado com sucesso