import 'package:flutter/material.dart';

import '../models/item.dart';

class DetailViewScreen extends StatelessWidget {
  final Product product;

  const DetailViewScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product-image-${product.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 260,
                    child: Center(
                      child: Icon(Icons.image_not_supported, size: 64),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              '${product.price.toStringAsFixed(2)} €',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
