*** Settings ***
Documentation    Teste da API de usuários
Resource    ../../../resources/api/login.resource


*** Test Cases ***
Cenário 01: Realizar Login com Sucesso
    Realizar Login com sucesso

Cenário 02: Realizar Login com Email Válido e Senha Inválida
    Realizar Login com Email Válido e Senha Inválida

Cenário 03: Realizar Login com Email Inválido e Senha Válida
    Realizar Login com Email Inválido e Senha Válida