class Validation {
  String? campoNome(String nome) {
    if (nome.isEmpty) {
      return 'Entre com seu usuário';
    }
    return null;
  }


  String? campoSenha(String senha) {
    if (senha.length < 8) {
      return 'A senha deve ter no mínimo 8 dígitos';
    }
    return null;
  }


  String? campoRua(String rua) {
    if (rua.isEmpty) {
      return 'Entre com sua rua';
    }
    return null;
  }

  String? campoN(String n) {
    if (n.isEmpty) {
      return 'Entre com seu número';
    }
    return null;
  }

  String? campoBairro(String bairro) {
    if (bairro.isEmpty) {
      return 'Entre com seu bairro';
    }
    return null;
  }

  String? campoTelefone(String telefone) {
    if (telefone.isEmpty) {
      return 'Entre com seu telefone';
    }
    return null;
  }

  String? campoComplemnto(String complemento) {
    if (complemento.isEmpty) {
      return 'Entre com seu telefone';
    }
    return null;
  }

  validarEndereco(String string) {}

}