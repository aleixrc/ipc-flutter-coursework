class Products {
  final List<Product> products;

  const Products({required this.products});

  factory Products.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'];
    if (rawProducts is! List) {
      throw const FormatException('El JSON no contiene productos válidos');
    }

    return Products(
      products: rawProducts.asMap().entries.map((entry) {
        final value = entry.value;
        if (value is! Map<String, dynamic>) {
          throw const FormatException('Formato de producto no válido');
        }
        return Product.fromJson(value, id: '${entry.key + 1}');
      }).toList(),
    );
  }
}

class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json, {required String id}) {
    final name = json['name'];
    final price = json['price'];
    final image = json['image'];
    final description = json['description'];

    if (name is! String ||
        price is! num ||
        image is! String ||
        description is! String) {
      throw const FormatException('Faltan datos obligatorios del producto');
    }

    return Product(
      id: id,
      name: name,
      price: price.toDouble(),
      image: image,
      description: description,
    );
  }
}
