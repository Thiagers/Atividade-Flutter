import 'package:flutter/material.dart';

import '../database/product_database.dart';
import '../model/produto_model.dart';
import 'components/list_item.dart';
import 'product_form_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<ProdutoModel>> _carregarProdutos() async {
    final db = ProductDatabase();
    return await db.findAllProducts();
  }

  Future<void> _updateList() async {
    await _carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Produtos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: const [
          IconButton(
            icon: Icon(Icons.list, color: Colors.white),
            onPressed: null,
          )
        ],
      ),
      backgroundColor: Colors.deepPurple[100],
      body: Scaffold(
        backgroundColor: Colors.grey[100],
        body: FutureBuilder<List<ProdutoModel>>(
          future: _carregarProdutos(),
          builder: (context, snapshort) {
            if (snapshort.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            } else if (snapshort.hasError) {
              return Center(
                child: Text(
                  "Erro ao carregar a lista de produtos: ${snapshort.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (!snapshort.hasData || snapshort.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum produto cadastrado.',
                  style: TextStyle(color: Colors.black54, fontSize: 18.0),
                ),
              );
            }

            final listaProduto = snapshort.data!;

            return ListView.builder(
              itemCount: listaProduto.length,
              itemBuilder: (context, index) {
                final produto = listaProduto[index];
                return ListItem(
                  product: produto,
                  onUpdate: _updateList,
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            ProdutoModel? produto = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(
                  product: null,
                ),
              ),
            );
            if (produto != null) {
              final db = ProductDatabase();
              await db.insertProduct(produto);
              setState(() {});
            }
          },
          label: const Text(
            'Novo Produto',
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
