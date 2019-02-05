# Cadastro de Extraterrestres - AG | SOFT

Dado os eventos recentes, de primeiro contato com raças alienígenas, o recém criado MAE - Ministério de Assuntos Extraterrestres, decidiu fazer um cadastro dos seres extraterrestres. Por falta de verbas, o processo da criação do passaporte intergalático deve ser automatizado com base nos documentos fornecidos pela imigração: um certificado de imigração emitido pelo agente de campo imigratório com dados do indivíduo e uma foto.  Seu trabalho é desenvolver um app administrativo, para a criação do passaporte intergalático dos seres extraterrestres. O seu app deve recortar a face do ser da imagem, extrair os dados do documento imigratório e gerar um preview do passaporte, provido o template. Você também deve criar uma API REST para fazer o censo de alienígenas, contando quantos existem de cada raça.

## Arquivos

Você tem disponível 3 tipos de arquivo para realizar o desafio, o documento de cadastro do extraterrestre, uma foto dele, e o template do passaporte.

> Como exemplo usaremos o extraterrestre Denny Devitto, nascido em 59353.42, do gênero masculino, da raça Eldar.

### Documento de cadastro

O documento de cadastro contém as informações iniciais para a emissão do documento de passaporte: Nome, Data de Nascimento*, Gênero e Raça
> A data de nascimento do extraterrestre está no calendário estrelar, não é necessária qualquer forma de conversão para o sistema de datas terrestres.

Segue abaixo um exemplo do documento, apontando os respectivos pontos acima, o documento foi censurado deixando somente informações essenciais ou não sensíveis a vista.

![documento](exemplo/documento.jpg?raw=true "documento")


### Passaporte

O passaporte deve ser preenchido de acordo com os campos, e a foto do passaporte deve conter o recorte da face do extraterrestre em preto-e-branco, como o exemplo:

> A data de emissão deve está no sistema de datas terrestres, no formato brasileiro.

![documento](exemplo/passaporte.jpg?raw=true "documento")

## Como prosseguir

Faça um *fork* desse repositório e realize esse teste, quando finalizar faça um *pull-request* nesse repositório para submeter sua tentativa.
