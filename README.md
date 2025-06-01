# 🛍️ App de Lista e Cadastro de Produtos – Flutter

Este projeto é um aplicativo Flutter desenvolvido para gerenciar produtos, com funcionalidades de **cadastro, exibição, edição e exclusão**. Ele utiliza **SQLite** como banco de dados local e uma interface amigável com Material Design 3.

---

## 📱 Funcionalidades

- ✅ Cadastro de novos produtos com campos personalizados
- ✅ Exibição de lista com chips de categoria, preço e desconto
- ✅ Edição e exclusão de produtos diretamente da lista
- ✅ Armazenamento local usando SQLite
- ✅ Interface responsiva para Flutter Web
- ✅ Controle de status (Ativo/Inativo e Em Promoção)

---

## 🧱 Estrutura de Pastas

```
lib/
│
├── database/
│   └── product_database.dart       # Conexão e manipulação do banco SQLite
│
├── model/
│   └── produto_model.dart          # Modelo de dados do produto
│
├── page/
│   ├── product_form_page.dart      # Tela de cadastro/edição do produto
│   ├── product_list_page.dart      # Tela principal com a lista de produtos
│   └── components/
│       └── list_item.dart          # Widget visual de cada produto
│
├── widgets/
│   ├── chip_info.dart              # Chips de categoria, promoção etc.
│   └── text_field_widget.dart      # Campo de texto reutilizável com estilos
│
└── main.dart                       # Arquivo principal do app
```

---

## 🧠 Modelo de Dados

Modelo: `ProdutoModel`

```dart
class ProdutoModel {
  int? id;
  String nome;
  double precoCompra;
  double precoVenda;
  int quantidade;
  String descricao;
  String categoria;
  String? imagem;
  bool ativo;
  bool emPromocao;
  double desconto;
}
```

---

## 💾 Banco de Dados Local (SQLite)

O app usa a biblioteca `sqflite` para persistência local. As operações disponíveis são:

- `insertProduct(ProdutoModel produto)`
- `findAllProducts()`
- `updateProduct(ProdutoModel produto)`
- `deleteProduct(int id)`

---

## 🚀 Como executar o projeto

### 1. Clonar o repositório
```bash
git clone https://github.com/seu-usuario/flutter-cadastro-produtos.git
cd flutter-cadastro-produtos
```

### 2. Instalar dependências
```bash
flutter pub get
```

### 3. Executar no navegador (Flutter Web)
```bash
flutter build web
npm install -g serve
serve build/web
```

Acesse em: [http://localhost:3000](http://localhost:3000)

---

## 🧪 Tecnologias e pacotes utilizados

| Pacote                     | Finalidade                           |
|---------------------------|--------------------------------------|
| `flutter`                 | SDK principal                        |
| `sqflite`                 | Banco de dados local SQLite          |
| `path`                    | Manipulação de caminhos              |
| `flutter_masked_text2`   | Formatação de moeda e número         |
| `serve` (Node.js)         | Servidor local para Flutter Web      |


