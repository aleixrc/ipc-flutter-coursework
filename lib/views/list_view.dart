import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/item.dart';
import 'detail_view.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  late Future<List<Product>> _productsFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _productsFuture = _loadProducts();
  }

  Future<List<Product>> _loadProducts() async {
    final contents = await rootBundle.loadString('resources/products.json');
    final decoded = jsonDecode(contents);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('El fichero de productos no es válido');
    }
    return Products.fromJson(decoded).products;
  }

  void _reloadProducts() {
    setState(() {
      _productsFuture = _loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
            tooltip: 'Recargar productos',
            onPressed: _reloadProducts,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No se han podido cargar los productos.'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _reloadProducts,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          final products = (snapshot.data ?? const <Product>[])
              .where(
                (product) => product.name.toLowerCase().contains(_searchQuery),
              )
              .toList();

          return RefreshIndicator(
            onRefresh: () async {
              _reloadProducts();
              await _productsFuture;
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: TextField(
                    onChanged: (value) => setState(
                      () => _searchQuery = value.trim().toLowerCase(),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Buscar producto',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchQuery.isEmpty
                          ? null
                          : IconButton(
                              onPressed: () =>
                                  setState(() => _searchQuery = ''),
                              icon: const Icon(Icons.clear),
                            ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: products.isEmpty
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: const [
                            SizedBox(height: 100),
                            Center(child: Text('No hay productos')),
                          ],
                        )
                      : ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return _ProductCard(product: products[index]);
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Hero(
          tag: 'product-image-${product.id}',
          child: Image.asset(
            product.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported, size: 48),
          ),
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${product.price.toStringAsFixed(2)} €'),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailViewScreen(product: product)),
        ),
      ),
    );
  }
}
