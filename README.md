# SQL e Power BI: Brasil e-commerce análise de vendas

## Apresentação
Este trabalho tem como objetivo analisar, de forma mais ampla, as principais características do comércio eletrônico brasileiro de pedidos feitos na loja Olist. O conjunto de dados contém informações de 100 mil pedidos de 2016 a 2018 feitos em vários marketplaces no Brasil. Foram analisadas várias estatísticas que permitem uma visão geral sobre o estado do e-commerce no Brasil; através da exploração em SQL foram respondidas perguntas importantes como qual o ticket médio, ticket médio por categoria de produto, onde estão localizados os vendedores, entre outros. Além disso, foi possível descobrir que quando o pedido chega depois da data estipulada, as avaliações dos clientes tendem a cair, demonstrando um ponto importante a ser corrigido para uma gestão saudável de qualquer e-commerce.

Também foi feito um dashboard em Power BI para melhor visualização de alguns resultados.

## Dados
O conjunto de dados é um conjunto de dados público de comércio eletrônico brasileiro de pedidos feitos na Loja Olist [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) que conta com informações de 100 mil pedidos de 2016 a 2018 feitos em vários marketplaces no Brasil. Suas características permitem visualizar um pedido em várias dimensões: desde o status do pedido, preço, desempenho de pagamento e frete até a localização do cliente, atributos do produto e, finalmente, avaliações escritas pelos clientes. Os detalhes completos dos dados estarão no link fornecido acima.

Os dados estão relacionados da seguinte forma:
![relação_dos_dados](https://i.imgur.com/HRhd2Y0.png)

## Análise de vendas
A análise de vendas foi feita com a intenção de conhecer o comércio eletrônico brasileiro de forma ampla e objetiva. As perguntas que foram respondidas foram:
  1. Qual ticket médio por compra?
  2. Qual ticket médio por categoria de produtos
  3. Quais métodos de compras mais utilizados?
  4. Em quantas parcelas geralmente é parcelado?
  5. Qual o fluxo de gasto por dia?
  6. Qual o fluxo de compra gasto por mês?
  7. Quais são os itens mais comprados?
## Análise geográfica
  1. Onde está localizado a maioria dos vendedores?
  2. Onde está localizado a maioria dos compradores?
  3. Qual categoria de item mais vendido em São Paulo?
  4. Quantos dias leva, em média, para chegar um item que chega em São Paulo
## Análise de feedback
  1. Qual a porcentagem de notas 5,4,3,2,1?
  2. Qual a média de nota quando o item chega antes da data estipulada?
  3. Qual a média de nota quando o item chega depois da data estipulada?

## Prévia de alguns resultados
  1. O ticket médio é de 161 reais
  2. 51% das pessoas compram à vista
  3. 74% das compras são feitas no cartão de crédito
  4. A avaliação da compra, em média, quando o item chega depois do tempo estipulado é de 2.6 contra 4.3 quando chega no tempo estipulado, mostrando uma possível avaliação baixa por causa da demora
  5. Demora, em média, 4 dias para um item chega em uma compra para São Paulo

## Power BI
Para melhor visualização dos dados foi criado um dashboard interativo que exibe os principais resultados da análise. A interação no dashboard ocorre na seção de "indicadores", onde é possível visualizar cada gráfico de pizza relacionado aos vendedores por região, compradores por região, número de parcelamentos, etc.
![dashboard](https://raw.githubusercontent.com/Joaovitorsilveiraesilva/brasil-ecommerce/main/Power%20bi%20brasil%20e-commerce.png)

## Código SQL
Essas perguntas foram respondidas através do desenvolvimento da análise sql, que você pode encontrar [aqui](https://github.com/Joaovitorsilveiraesilva/brasil-ecommerce/blob/main/ecommercebrasil.sql)
