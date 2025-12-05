*** Settings ***
Resource    ../../../resources/api/user/user_exception.resource


*** Test Cases ***
Cenário 01: Listar Usuario Informando Id Invalido
    Listar Usuário por Id Inválido

Cenário 02: Listar Usuario Informando Id Não cadastrado
    Listar Usuario Informando Id Não cadastrado

Cenário 03: Listar Usuario com Token Invalido
    Listar Usuario Informando Token Invalido

Cenário 04: Listar Usuario com Token Vazio
    Listar Usuario Informando Token Vazio