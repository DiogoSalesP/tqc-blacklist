*** Settings ***
Resource    ../../../resources/ui/login.resource
Resource    ../../../resources/ui/cost_center.resource
Resource    ../../../resources/ui/common.resource
Task Setup    Abrir Navegador
Task Teardown    Fechar Navegador


*** Test Cases ***
Cenario 01: Cadastrar Novo Centro de Custo
    [Documentation]    Realizar login, navega até Centro de Custo, cadastra um novo Centro de Custo e verificar se foi cadastrado com sucesso

    Dado que estou na página de login
    Quando eu inserir um usuário válido e senha válida
    E clicar no botão de login
    Então devo ser redirecionado para a página Home

    Dado que estou na página de centro de custo
    Quando clicar para adicionar um novo centro de custo
    E preencher os dados obrigatórios
    E salvar o cadastro
    # Então o centro de custo deve ser cadastrado com sucesso