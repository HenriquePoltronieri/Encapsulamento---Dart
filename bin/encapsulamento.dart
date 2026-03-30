import 'dart:io';
import 'dart:convert';
import '../lib/conteudo.dart';

void main() {

  String conteudoArquivo = File('dados.json').readAsStringSync();

  Map<String, dynamic> dados = jsonDecode(conteudoArquivo);

  Filme filme = Filme(dados['titulo']);

  try {
    filme.validarClassificacao = dados['classificacao'];
  } catch (e) {
    print(e);
  }
}
