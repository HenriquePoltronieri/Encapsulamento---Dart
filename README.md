# PARTE 1: PESQUISA TEÓRICA

1 - Qual a função do modificador de acesso privado (o uso do underscore "_" antes do nome da variável) no Dart?

    R: O underscore (_) indica que uma variável ou método é privado ao arquivo onde foi declarado. Isso impede que outros arquivos acessem esse elemento diretamente, ajudando a proteger os dados e aplicar o encapsulamento.

2 - Explique com suas palavras a diferença prática entre acessar uma variável diretamente e acessá-la através de um Getter.

    R: Acessar diretamente significa pegar o valor da variável sem nenhum controle. Já o Getter permite adicionar lógica ao acesso, como validações ou formatação. Na prática, o Getter oferece mais segurança e flexibilidade.
 
3 - Qual é a principal responsabilidade de um Setter dentro do conceito de Encapsulamento?

    R: O Setter serve para alterar o valor de uma variável com controle, permitindo validar os dados antes da atribuição e proteger o estado interno do objeto.

4 - O que acontece no código se tentarmos acessar um atributo privado de uma classe estando em um arquivo diferente de onde ela foi declarada?

    R: O código gera um erro de compilação, pois atributos privados (com _) só podem ser acessados dentro do mesmo arquivo.

5 - Explique o motivo pelo qual o Dart não permite instanciar diretamente uma classe abstrata (ex: var c = Conteudo();).

    R: Porque classes abstratas podem ter métodos sem implementação. Elas funcionam como modelo e precisam ser herdadas por classes concretas antes de serem usadas.

6 - O que faz a anotação @override e em quais situações seu uso é obrigatório?

    R: Ela indica que um método está sobrescrevendo um método da classe pai. Não é obrigatório, mas é recomendado para evitar erros e deixar o código mais claro.

7 - Qual a utilidade da função jsonDecode da biblioteca dart:convert quando estamos lidando com leitura de arquivos36?

    R: Ela converte uma String JSON em estruturas do Dart (como Map ou List), sendo muito útil para leitura de arquivos e consumo de APIs.








# PARTE 2: ATIVIDADE PRÁTICA (MODELAGEM)
## Exercício 1: Criando a Abstração
1 - Crie um arquivo chamado "lib/conteudo.dart".

2 - Dentro dele, crie a classe abstrata "Conteudo".

3 - Adicione um atributo público do tipo String chamado "titulo".

4 - Adicione um atributo privado do tipo int chamado "_classificacao".

5 - Crie um Getter chamado "classificacaoIndicativa" para retornar o valor do atributo privado.

6 - Crie um Setter chamado "validarClassificacao". Ele deve receber um valor inteiro e verificar: se o valor for menor que 0 ou maior que 18, lance uma Exception com a mensagem "Classificação inválida". Caso contrário, atribua o valor ao atributo privado.

7 - Crie o método abstrato "void darPlay();" (sem corpo).

## Exercício 2: Herança e Especialização - Ainda no arquivo "lib/conteudo.dart":

1 - Crie a classe "Filme" que herda da classe "Conteudo".

2 - Implemente o método darPlay() para imprimir no console: "Reproduzindo o filme: [titulo]".

3 - Crie a classe "Serie" que também herda de "Conteudo".

4 - Adicione na classe Serie o atributo público "temporadas" (int).

5 - Implemente o método darPlay() para imprimir no console: "Iniciando a série [titulo] com [temporadas] temporadas".








# PARTE 3: CONSUMO DE DADOS E VALIDAÇÃO
## Exercício 3: Lendo o "Banco de Dados" JSON

1 - Crie um arquivo físico na raiz do seu projeto (fora das pastas lib e bin) chamado "dados.json".

Cole exatamente este conteúdo dentro dele:

2 - {"titulo": "Coringa", "classificacao": -5}

3 - Crie ou abra o arquivo "bin/main.dart".

4 - Importe as bibliotecas dart:io, dart:convert e o seu arquivo conteudo.dart.

5 - No método main, utilize a classe File para ler o conteúdo do arquivo dados.json e guarde o resultado em uma String.

6 - Utilize a função jsonDecode para converter essa String em um Map.

7 - Instancie um objeto do tipo Filme e atribua a ele o título que veio do Map.

8 - Crie um bloco try-catch. Dentro do try, chame o Setter "validarClassificacao" passando o valor da classificação que veio do arquivo JSON. No catch, imprima o erro gerado no console.









# PARTE 4: RELATÓRIO FINAL

## Responda com base no que você observou executando o código:

1 - O que foi impresso no console quando o seu programa tentou passar a classificação "-5" (vinda do JSON) para o objeto?

    R: O programa tentou aplicar a classificação -5, o setter lançou uma exceção e o erro foi capturado pelo try-catch, evitando que o programa travasse.

2 - Como o uso do Encapsulamento neste exercício garantiu a segurança e a integridade dos dados do seu sistema?

    R: Protegeu os dados ao impedir acesso direto ao atributo e validar valores no setter, garantindo que apenas classificações válidas fossem aceitas.

3 - Se o arquivo "dados.json" estivesse completamente em branco no momento da leitura, qual seria o comportamento da função jsonDecode?

    R: A função jsonDecode lançaria uma FormatException, pois uma string vazia não é um JSON válido.

4 - Qual a principal vantagem de definir o método darPlay() na classe pai de forma abstrata, em vez de criar métodos independentes apenas nas classes filhas?

    R: Garante que todas as subclasses implementem darPlay() e permite usar polimorfismo, tratando diferentes objetos de forma uniforme.

5 - Qual foi a maior dificuldade encontrada durante a realização desta atividade?

    R: Entender como funciona a privacidade no Dart (por arquivo, não por classe) e organizar corretamente os arquivos.
