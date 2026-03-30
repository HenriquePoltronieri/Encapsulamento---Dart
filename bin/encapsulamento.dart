import 'dart:io';
import 'dart:convert';
import 'package:encapsulamento/encapsulamento.dart';


void salvar(Conta conta){
  final arquivo = File('./dados.json');
  arquivo.writeAsStringSync(jsonEncode(conta.toJson()));
}


void main() {
 Conta minhaConta;

 final arquivo = File('./dados.json');

 if(arquivo.existsSync()){
  var dados = jsonDecode(arquivo.readAsStringSync());
  minhaConta = ContaCorrente(dados['titular']);
  minhaConta.atualizarSaldo = dados['saldo'];

 }else{
  minhaConta = ContaCorrente('Igor');
 }

 while (true) {
   print(
     '\nTitular: ${minhaConta.titular} | Saldo: R\$ ${minhaConta.saldoAtual}',
   );
   stdout.write('[1] Depósito | [2] Saque | [3] Sair: ');
   var op = stdin.readLineSync();


   if (op == '3') break;


   try {
     if (op == '1') {
       stdout.write('Valor: ');
       double v = double.parse(stdin.readLineSync()!);
       minhaConta.depositar(v);
     } else if (op == '2') {
       stdout.write('Valor: ');
       double v = double.parse(stdin.readLineSync()!);
       minhaConta.sacar(v);
     }


    salvar(minhaConta);
   } catch (e) {
     print('⚠️ Erro: $e');
   }
 }
}
