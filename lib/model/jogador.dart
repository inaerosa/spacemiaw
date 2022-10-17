class Jogador {
  int? id;
  String? nome;
  int? pontos;

  Jogador();

  Jogador.fromMap(Map map) {
    id = map['id'];
    nome = map['nome'];
    pontos = map['pontos'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'nome': nome, 'pontos': pontos};

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  @override
  String toString() {
    return ('ID: $id |  Jogador: $nome | Pontos: $pontos');
  }
}
