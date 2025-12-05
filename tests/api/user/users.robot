*** Settings ***
Resource    ../../../resources/api/user/user.resource


*** Test Cases ***
Cenário 01: Listar Usuários Cadastrados
    Listar Usuários

Cenário 02: Cadastrar Novo Usuário com Sucesso
    Cadastrar Usuario com Sucesso

Cenário 03: Contar Usuários Cadastrados
    Contar Usuario

Cenário 04: Listar Usuário Cadastrado por id
    Listar Usuario Por Id

Cenário 05: Editar usuario por id com Sucesso
    Editar Usuario com Sucesso

Cenário 06: Atualizar Status do Usuario para True
    Atualizar Status Para "true"

Cenário 07: Atualizar Status do Usuario para False
    Atualizar Status Para "false"

Cenário 08: Deletar Usuario por id com Sucesso
    Deletar usuário com sucesso