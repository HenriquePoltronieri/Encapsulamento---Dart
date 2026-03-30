import 'dart:developer';
import 'dart:io';

abstract class Conteudo {
  String titulo;
  int _classificacao = 0;
  Conteudo(this.titulo);
  
  int get classificacaoIndicativa => _classificacao;

set validarClassificacao(int valor) {
  if (valor >= 0 && valor <= 18) {
    _classificacao = valor;
  } else {
    throw ArgumentError("Classificação Inválida");
  }
}

  void darPlay() {}
}

class Filme extends Conteudo {
  Filme(String titulo ) : super(titulo);
  
  @override
  void darPlay() {
   print("Reproduzindo Filme: $titulo");
  }
}

class Serie extends Conteudo {
  int temporada;

  Serie(String titulo, this.temporada) : super(titulo);

  @override
  void darPlay() {
    print("Iniciando a série $titulo com $temporada temporada");
  }
}
